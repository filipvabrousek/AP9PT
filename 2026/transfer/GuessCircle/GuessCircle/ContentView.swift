import SwiftUI

struct ContentView: View {
    private let circleCount = 3
    private let colors: [Color] = [.red, .green, .blue]

    @State private var correctIndex = Int.random(in: 0..<3)
    @State private var wrongGuesses: Set<Int> = []
    @State private var hasWon = false

    var body: some View {
        ZStack {
            VStack(spacing: 40) {
                Text("Which circle is the right one?")
                    .font(.title2.bold())
                    .multilineTextAlignment(.center)

                HStack(spacing: 24) {
                    ForEach(0..<circleCount, id: \.self) { index in
                        circle(at: index)
                    }
                }

                Text(wrongGuesses.isEmpty ? "Tap a circle to guess" : "Wrong! Try again.")
                    .foregroundStyle(wrongGuesses.isEmpty ? Color.secondary : Color.red)
            }
            .padding()
            .blur(radius: hasWon ? 6 : 0)

            if hasWon {
                winView
                    .transition(.scale.combined(with: .opacity))
            }
        }
        .animation(.spring(duration: 0.4), value: hasWon)
        .animation(.spring(duration: 0.3), value: wrongGuesses)
    }

    private func circle(at index: Int) -> some View {
        let isWrong = wrongGuesses.contains(index)

        return Circle()
            .fill(colors[index])
            .frame(width: 90, height: 90)
            .opacity(isWrong ? 0.3 : 1)
            .overlay {
                if isWrong {
                    Image(systemName: "xmark")
                        .font(.largeTitle.bold())
                        .foregroundStyle(.white)
                }
            }
            .shadow(radius: isWrong ? 0 : 6)
            .onTapGesture { guess(index) }
            .allowsHitTesting(!isWrong && !hasWon)
    }

    private var winView: some View {
        VStack(spacing: 24) {
            Text("You Win!")
                .font(.system(size: 56, weight: .heavy, design: .rounded))
                .foregroundStyle(.green)

            Text(wrongGuesses.isEmpty ? "First try!" : "Found it in \(wrongGuesses.count + 1) tries")
                .font(.headline)
                .foregroundStyle(.secondary)

            Button("Play Again", action: reset)
                .buttonStyle(.borderedProminent)
                .controlSize(.large)
        }
        .padding(40)
        .background(.regularMaterial, in: .rect(cornerRadius: 28))
    }

    private func guess(_ index: Int) {
        if index == correctIndex {
            hasWon = true
        } else {
            wrongGuesses.insert(index)
        }
    }

    private func reset() {
        correctIndex = Int.random(in: 0..<circleCount)
        wrongGuesses = []
        hasWon = false
    }
}

#Preview {
    ContentView()
}
