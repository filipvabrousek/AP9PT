import SwiftUI

struct ContentView: View {
    @State private var store = TodoStore()
    @State private var newTitle = ""

    var body: some View {
        NavigationStack {
            List {
                HStack {
                    TextField("New task", text: $newTitle)
                        .onSubmit(addItem)
                    Button("Add", action: addItem)
                        .disabled(newTitle.trimmingCharacters(in: .whitespaces).isEmpty)
                }
                .alignmentGuide(.listRowSeparatorLeading) { _ in 0 }

                ForEach(store.items) { item in
                    Text(item.title)
                }
                .onDelete(perform: store.delete)
            }
            .navigationTitle("To-Do")
        }
    }

    private func addItem() {
        store.add(newTitle)
        newTitle = ""
    }
}

#Preview {
    ContentView()
}
