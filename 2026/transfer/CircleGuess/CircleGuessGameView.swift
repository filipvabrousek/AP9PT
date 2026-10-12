import SwiftUI

struct CircleGuessGameView: View {
    private let colors: [Color] = [.red, .green, .blue]

    @State private var correctIndex = Int.random(in: 0..<3)
    @State private var hasWon = false
    @State private var message = "Tap the circle you think is correct!"
    @State private var wrongGuesses: Set<Int> = []

    var body: some View {
        VStack(spacing: 40) {
            if hasWon {
                Text("You Win! 🎉")
                    .font(.largeTitle.bold())
                    .foregroundStyle(.green)
                    .transition(.scale.combined(with: .opacity))
            } else {
                Text("Guess the Circle")
                    .font(.largeTitle.bold())
            }

            Text(message)
                .font(.headline)
                .foregroundStyle(.secondary)

            HStack(spacing: 24) {
                ForEach(0..<3, id: \.self) { index in
                    Circle()
                        .fill(colors[index])
                        .frame(width: 90, height: 90)
                        .opacity(wrongGuesses.contains(index) ? 0.3 : 1)
                        .overlay(
                            Circle()
                                .stroke(Color.yellow, lineWidth: hasWon && index == correctIndex ? 6 : 0)
                        )
                        .scaleEffect(hasWon && index == correctIndex ? 1.15 : 1)
                        .onTapGesture { guess(index) }
                        .disabled(hasWon || wrongGuesses.contains(index))
                }
            }

            if hasWon {
                Button("Play Again", action: reset)
                    .buttonStyle(.borderedProminent)
            }
        }
        .padding()
        .animation(.spring(), value: hasWon)
        .animation(.easeInOut, value: wrongGuesses)
    }

    private func guess(_ index: Int) {
        guard !hasWon, !wrongGuesses.contains(index) else { return }
        if index == correctIndex {
            hasWon = true
            message = "That's the one!"
        } else {
            wrongGuesses.insert(index)
            message = "Nope, try again!"
        }
    }

    private func reset() {
        correctIndex = Int.random(in: 0..<3)
        hasWon = false
        wrongGuesses = []
        message = "Tap the circle you think is correct!"
    }
}

#Preview {
    CircleGuessGameView()
}
