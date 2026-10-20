import SwiftUI

@main
struct TodoAppApp: App {
    var body: some Scene {
        WindowGroup {
          //  ContentView()
            MyToDo()
        }
    }
}


struct MyToDo: View {
    @State var items = [String]()
    @State var text = ""
    
    var body: some View {
        HStack {
            TextField("Enter a task", text: $text)
            
            Button("Add a task"){
                items.append(text)
                text = ""
            }
        }.padding()
        
        List {
            ForEach(items, id: \.self){ t in
                Text(t)
            }
        }
        
        
        
        
    }
}
