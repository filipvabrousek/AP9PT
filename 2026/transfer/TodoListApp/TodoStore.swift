import Foundation

// In-memory only: the list resets when the app is relaunched.
@MainActor
final class TodoStore: ObservableObject {
    @Published var items: [TodoItem] = []

    var remainingCount: Int {
        items.filter { !$0.isDone }.count
    }

    var hasCompleted: Bool {
        items.contains(where: \.isDone)
    }

    func add(_ title: String) {
        let trimmed = title.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !trimmed.isEmpty else { return }
        items.append(TodoItem(title: trimmed))
    }

    func remove(atOffsets offsets: IndexSet) {
        items.remove(atOffsets: offsets)
    }

    func move(fromOffsets source: IndexSet, toOffset destination: Int) {
        items.move(fromOffsets: source, toOffset: destination)
    }

    func clearCompleted() {
        items.removeAll(where: \.isDone)
    }
}
