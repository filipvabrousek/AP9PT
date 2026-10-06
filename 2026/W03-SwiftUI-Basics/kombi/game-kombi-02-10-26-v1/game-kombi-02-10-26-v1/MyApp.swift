import SwiftUI

@main
struct CircleGuessApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

struct ContentView: View {
    /// The circle to find. Drawn again at the start of every round.
    @State private var winner = Int.random(in: 0..<3)
    /// The circle tapped in this round, or `nil` while the round is open.
    @State private var picked: Int?
    @State private var score = 0
    @State private var rounds = 0

    var body: some View {
        VStack(spacing: 40) {
            Text("Guess the circle")
                .font(.largeTitle.bold())

            Text(message)
                .font(.title3)
                .foregroundStyle(.secondary)

            HStack(spacing: 24) {
                ForEach(0..<3, id: \.self) { index in
                    Button {
                        pick(index)
                    } label: {
                        Circle()
                            .fill(color(of: index))
                            .frame(width: 90, height: 90)
                    }
                    .buttonStyle(.plain)
                    .accessibilityLabel("Circle \(index + 1)")
                }
            }
            .animation(.easeInOut, value: picked)

            Text("Score: \(score) of \(rounds)")
                .monospacedDigit()

            Button("Play again", action: newRound)
                .buttonStyle(.borderedProminent)
                .disabled(picked == nil)
        }
        .padding()
    }

    private var message: String {
        guard let picked else { return "One of them is the right one." }
        return picked == winner ? "Correct!" : "Wrong — it was circle \(winner + 1)."
    }

    /// Blue while the round is open; afterwards green for the winner, red for a
    /// wrong guess, grey for the rest.
    private func color(of index: Int) -> Color {
        guard let picked else { return .blue }
        if index == winner { return .green }
        return index == picked ? .red : .gray
    }

    private func pick(_ index: Int) {
        guard picked == nil else { return }   // one guess per round
        picked = index
        rounds += 1
        if index == winner { score += 1 }
    }

    private func newRound() {
        winner = Int.random(in: 0..<3)
        picked = nil
    }
}
