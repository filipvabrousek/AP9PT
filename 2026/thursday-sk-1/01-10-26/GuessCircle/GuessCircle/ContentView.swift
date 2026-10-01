import SwiftUI

struct ContentView: View {
    @State private var correctIndex = Int.random(in: 0..<3)
    @State private var tappedIndex: Int?
    @State private var hasWon = false

    private let colors: [Color] = [.red, .green, .blue]

    var body: some View {
        VStack(spacing: 40) {
            Text(hasWon ? "You Win!" : "Guess the correct circle")
                .font(hasWon ? .largeTitle.bold() : .title2)
                .foregroundStyle(hasWon ? .green : .primary)
                .animation(.spring, value: hasWon)

            HStack(spacing: 24) {
                ForEach(0..<3, id: \.self) { index in
                    Circle()
                        .fill(colors[index])
                        .frame(width: 90, height: 90)
                        .opacity(tappedIndex == nil || tappedIndex == index ? 1 : 0.4)
        .overlay {
    if tappedIndex == index {
        Image(systemName: index == correctIndex ? "checkmark" : "xmark")
                                    .font(.largeTitle.bold())
                                    .foregroundStyle(.white)
                            }
                        }
                        .scaleEffect(tappedIndex == index ? 1.15 : 1)
                        .animation(.spring, value: tappedIndex)
                        .onTapGesture { guess(index) }
                        .disabled(hasWon)
                }
            }

            if tappedIndex != nil && !hasWon {
                Text("Wrong! Try again.")
                    .foregroundStyle(.red)
            }

            Button("New Game", action: reset)
                .buttonStyle(.borderedProminent)
        }
        .padding()
    }

    private func guess(_ index: Int) {
        guard !hasWon else { return }
        tappedIndex = index
        hasWon = index == correctIndex
    }

    private func reset() {
        correctIndex = Int.random(in: 0..<3)
        tappedIndex = nil
        hasWon = false
    }
}
