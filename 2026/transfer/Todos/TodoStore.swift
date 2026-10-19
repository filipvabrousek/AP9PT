import Foundation

// In-memory only: the list resets every time the app launches.
final class TodoStore: ObservableObject {
    @Published var todos: [Todo]

    init(todos: [Todo] = []) {
        self.todos = todos
    }

    var remainingCount: Int {
        todos.filter { !$0.isDone }.count
    }

    var hasCompleted: Bool {
        todos.contains(where: \.isDone)
    }

    func add(_ title: String) {
        let trimmed = title.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !trimmed.isEmpty else { return }
        todos.append(Todo(title: trimmed))
    }

    func toggle(_ todo: Todo) {
        guard let index = todos.firstIndex(where: { $0.id == todo.id }) else { return }
        todos[index].isDone.toggle()
    }

    func delete(at offsets: IndexSet) {
        todos.remove(atOffsets: offsets)
    }

    func move(from source: IndexSet, to destination: Int) {
        todos.move(fromOffsets: source, toOffset: destination)
    }

    func clearCompleted() {
        todos.removeAll(where: \.isDone)
    }
}
