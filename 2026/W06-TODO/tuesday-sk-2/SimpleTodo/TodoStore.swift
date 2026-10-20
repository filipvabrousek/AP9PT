import SwiftUI

/// In-memory store. Items are lost when the app quits (no persistence yet).
@Observable
final class TodoStore {
    var items: [TodoItem] = []

    var remainingCount: Int { items.filter { !$0.isDone }.count }

    func add(_ title: String) {
        let trimmed = title.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !trimmed.isEmpty else { return }
        items.append(TodoItem(title: trimmed))
    }

    func toggle(_ item: TodoItem) {
        guard let index = items.firstIndex(where: { $0.id == item.id }) else { return }
        items[index].isDone.toggle()
    }

    func delete(at offsets: IndexSet) {
        items.remove(atOffsets: offsets)
    }

    func move(from source: IndexSet, to destination: Int) {
        items.move(fromOffsets: source, toOffset: destination)
    }

    func clearCompleted() {
        items.removeAll { $0.isDone }
    }
}
