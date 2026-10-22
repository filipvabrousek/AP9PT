import SwiftUI

struct ContentView: View {
    @StateObject private var store = TodoStore()
    @State private var newTitle = ""
    @FocusState private var isInputFocused: Bool
    @State var showAlert = false
    
    var body: some View {
        NavigationStack {
            List {
                Section {
                    HStack {
                        TextField("Add a task", text: $newTitle)
                            .focused($isInputFocused)
                            .submitLabel(.done)
                            .onSubmit(addItem)
                        
                        // On Button tap => show alert dialog if the textfield is empty
                        
                        Button(action: addItem) {
                            Image(systemName: "plus.circle.fill")
                                .font(.title2)
                        }
                        .buttonStyle(.borderless)
                       // .disabled(trimmedTitle.isEmpty)
                        .accessibilityLabel("Add task")
                        .alert("Task is empty", isPresented: $showAlert) {
                            Button("OK"){
                                
                            }
                        }
                        
                    }
                }

                Section {
                    ForEach($store.items) { $item in
                        TodoRow(item: $item)
                    }
                    .onDelete(perform: store.remove)
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
                if !store.items.isEmpty {
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

    private func addItem() {
        
        if trimmedTitle.isEmpty {
            showAlert = true
            return
        }
        
        withAnimation {
            store.add(trimmedTitle)
        }
        newTitle = ""
        isInputFocused = true
    }
}

private struct TodoRow: View {
    @Binding var item: TodoItem

    var body: some View {
        Button {
            withAnimation { item.isDone.toggle() }
        } label: {
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
