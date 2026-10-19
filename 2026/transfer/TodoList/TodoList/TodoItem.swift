import Foundation

struct TodoItem: Identifiable {
    let id = UUID()
    var title: String
}

/// In-memory store — items are lost when the app quits (no persistence yet).
@Observable
final class TodoStore {
    var items: [TodoItem] = [
        TodoItem(title: "Buy groceries"),
        TodoItem(title: "Call mom"),
    ]

    func add(_ title: String) {
        let trimmed = title.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !trimmed.isEmpty else { return }
        items.append(TodoItem(title: trimmed))
    }

    func delete(at offsets: IndexSet) {
        items.remove(atOffsets: offsets)
    }
}
