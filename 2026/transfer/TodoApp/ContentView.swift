import SwiftUI

struct ContentView: View {
    @State private var store = TodoStore()
    @State private var newTitle = ""
    @FocusState private var isInputFocused: Bool
    @State var showAlert = false
    
    var body: some View {
        NavigationStack {
            List {
                Section {
                    HStack {
                        TextField("New todo", text: $newTitle)
                            .focused($isInputFocused)
                            .submitLabel(.done)
                            .onSubmit(addTodo)
                        
                        // On button click with newTitle empty => Show alert
                        Button("Add", systemImage: "plus.circle.fill", action: addTodo)
                            .labelStyle(.iconOnly)
                            .font(.title2)
                            .alert(isPresented: $showAlert){
                                Alert(title: Text("Fill-in data"))
                            }
                           // .disabled(newTitle.trimmingCharacters(in: .whitespaces).isEmpty)
                    }
                }

                Section {
                    if store.items.isEmpty {
                        ContentUnavailableView("No Todos", systemImage: "checklist",
                                               description: Text("Add your first todo above."))
                    } else {
                        ForEach(store.items) { item in
                            TodoRow(item: item) { store.toggle(item) }
                        }
                        .onDelete(perform: store.delete)
                        .onMove(perform: store.move)
                    }
                } footer: {
                    if !store.items.isEmpty {
                        Text("\(store.remainingCount) of \(store.items.count) remaining")
                    }
                }
            }
            .navigationTitle("Todos")
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    EditButton().disabled(store.items.isEmpty)
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Clear Done", action: store.clearCompleted)
                        .disabled(store.items.allSatisfy { !$0.isDone })
                }
            }
        }
    }

    private func addTodo() {
        if newTitle.isEmpty {
            showAlert.toggle()
            return
        }
        
        store.add(newTitle)
        newTitle = ""
        isInputFocused = true
    }
}

struct TodoRow: View {
    let item: TodoItem
    let onToggle: () -> Void

    var body: some View {
        Button(action: onToggle) {
            HStack {
                Image(systemName: item.isDone ? "checkmark.circle.fill" : "circle")
                    .foregroundStyle(item.isDone ? Color.accentColor : .secondary)
                    .font(.title3)
                Text(item.title)
                    .strikethrough(item.isDone)
                    .foregroundStyle(item.isDone ? .secondary : .primary)
            }
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    ContentView()
}
