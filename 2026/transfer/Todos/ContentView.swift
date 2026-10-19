import SwiftUI

struct ContentView: View {
    @EnvironmentObject private var store: TodoStore
    @State private var newTitle = ""
    @FocusState private var isInputFocused: Bool

    var body: some View {
        NavigationStack {
            List {
                Section {
                    HStack {
                        TextField("New to-do", text: $newTitle)
                            .focused($isInputFocused)
                            .submitLabel(.done)
                            .onSubmit(addTodo)

                        Button(action: addTodo) {
                            Image(systemName: "plus.circle.fill")
                                .font(.title2)
                        }
                        .buttonStyle(.borderless)
                        .disabled(trimmedTitle.isEmpty)
                        .accessibilityLabel("Add to-do")
                    }
                }

                Section {
                    ForEach(store.todos) { todo in
                        TodoRow(todo: todo) {
                            withAnimation { store.toggle(todo) }
                        }
                    }
                    .onDelete(perform: store.delete)
                    .onMove(perform: store.move)
                } footer: {
                    if !store.todos.isEmpty {
                        Text("\(store.remainingCount) of \(store.todos.count) remaining")
                    }
                }
            }
            .overlay {
                if store.todos.isEmpty {
                    ContentUnavailableView(
                        "No To-Dos",
                        systemImage: "checklist",
                        description: Text("Add your first task above.")
                    )
                    .allowsHitTesting(false)
                }
            }
            .navigationTitle("To-Do List")
            .toolbar {
                if !store.todos.isEmpty {
                    ToolbarItem(placement: .topBarLeading) {
                        EditButton()
                    }
                }
                if store.hasCompleted {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button("Clear Done") {
                            withAnimation { store.clearCompleted() }
                        }
                    }
                }
            }
        }
    }

    private var trimmedTitle: String {
        newTitle.trimmingCharacters(in: .whitespacesAndNewlines)
    }

    private func addTodo() {
        guard !trimmedTitle.isEmpty else { return }
        withAnimation {
            store.add(trimmedTitle)
        }
        newTitle = ""
        isInputFocused = true
    }
}

struct TodoRow: View {
    let todo: Todo
    let onToggle: () -> Void

    var body: some View {
        Button(action: onToggle) {
            HStack(spacing: 12) {
                Image(systemName: todo.isDone ? "checkmark.circle.fill" : "circle")
                    .font(.title3)
                    .foregroundStyle(todo.isDone ? Color.accentColor : .secondary)
                Text(todo.title)
                    .strikethrough(todo.isDone)
                    .foregroundStyle(todo.isDone ? .secondary : .primary)
                Spacer()
            }
            .contentShape(Rectangle())
        }
        .buttonStyle(.plain)
        .accessibilityAddTraits(todo.isDone ? .isSelected : [])
    }
}

#Preview {
    ContentView()
        .environmentObject(TodoStore(todos: [
            Todo(title: "Buy milk"),
            Todo(title: "Walk the dog", isDone: true),
        ]))
}
