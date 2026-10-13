import SwiftUI

struct ContentView: View {
    @State private var correctIndex = Int.random(in: 0..<3)
    @State private var tappedIndex: Int?
    @State private var hasWon = false

    private let colors: [Color] = [.red, .green, .blue]

    var body: some View {
        VStack(spacing: 40) {
            if hasWon {
                Text("You Win! 🎉")
                    .font(.largeTitle.bold())
                    .foregroundStyle(.green)
                    .transition(.scale.combined(with: .opacity))
            } else {
                Text("Guess the correct circle!")
                    .font(.title2.bold())
            }

            HStack(spacing: 24) {
                ForEach(0..<3, id: \.self) { index in
                    Circle()
                        .fill(fillColor(for: index))
                        .frame(width: 90, height: 90)
                        .overlay(
                            Circle().stroke(.primary.opacity(0.2), lineWidth: 2)
                        )
                        .scaleEffect(tappedIndex == index ? 1.15 : 1)
                        .onTapGesture { guess(index) }
                        .disabled(hasWon)
                }
            }

            if let tappedIndex, !hasWon, tappedIndex != correctIndex {
                Text("Nope, try again!")
                    .foregroundStyle(.red)
            }

            if hasWon {
                Button("Play Again", action: reset)
                    .buttonStyle(.borderedProminent)
            }
        }
        .padding()
        .animation(.spring(response: 0.4, dampingFraction: 0.6), value: tappedIndex)
        .animation(.spring(response: 0.4, dampingFraction: 0.6), value: hasWon)
    }

    private func fillColor(for index: Int) -> Color {
        if hasWon && index == correctIndex { return .yellow }
        return colors[index]
    }

    private func guess(_ index: Int) {
        guard !hasWon else { return }
        tappedIndex = index
        if index == correctIndex {
            hasWon = true
        }
    }

    private func reset() {
        correctIndex = Int.random(in: 0..<3)
        tappedIndex = nil
        hasWon = false
    }
}

#Preview {
    ContentView()
}
