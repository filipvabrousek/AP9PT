import SwiftUI

struct ContentView: View {
    @State private var store = TodoStore()
    @State private var newTitle = ""
    @FocusState private var isInputFocused: Bool
    @State var show = false
    
    var body: some View {
        NavigationStack {
            List {
                Text("Task count \(store.items.count)")
                
                Text("Done tasks  \(store.items.filter {$0.isDone}.count) / \(store.items.count)")
                // Number of done tasks from the total task count
                
                Section {
                    HStack {
                        TextField("Add a task", text: $newTitle)
                            .focused($isInputFocused)
                            .submitLabel(.done)
                            .onSubmit(addItem)
                        
                        Button(action: addItem) {
                            Image(systemName: "plus.circle.fill")
                                .font(.title2)
                        }
                        .buttonStyle(.borderless)
                        //.disabled(newTitle.trimmingCharacters(in: .whitespaces).isEmpty)
                        .accessibilityLabel("Add task")
                        .alert(isPresented: $show){
                            Alert(title: Text("Please enter some text"))
                        }
                    }
                }

                Section {
                    ForEach(store.items) { item in
                        TodoRow(item: item) { store.toggle(item) }
                    }
                    .onDelete(perform: store.delete)
                    .onMove(perform: store.move)
                } footer: {
                    if !store.items.isEmpty {
                        Text("\(store.remainingCount) of \(store.items.count) remaining")
                    }
                }
            }
            .overlay {
                if store.items.isEmpty {
                    ContentUnavailableView(
                        "No Tasks",
                        systemImage: "checklist",
                        description: Text("Add your first task above.")
                    )
                    .allowsHitTesting(false)
                }
            }
            .navigationTitle("Todos")
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    if store.items.contains(where: \.isDone) {
                        Button("Clear Done", action: store.clearCompleted)
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    if !store.items.isEmpty {
                        EditButton()
                    }
                }
            }
            .animation(.default, value: store.items)
        }
    }

    private func addItem() {
        
        if newTitle.isEmpty {
            show.toggle()
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
            HStack(spacing: 12) {
                Image(systemName: item.isDone ? "checkmark.circle.fill" : "circle")
                    .font(.title3)
                    .foregroundStyle(item.isDone ? Color.accentColor : .secondary)
                Text(item.title)
                    .strikethrough(item.isDone)
                    .foregroundStyle(item.isDone ? .secondary : .primary)
                Spacer()
            }
            .contentShape(Rectangle())
        }
        .buttonStyle(.plain)
        .accessibilityAddTraits(item.isDone ? .isSelected : [])
    }
}

#Preview {
    ContentView()
}
