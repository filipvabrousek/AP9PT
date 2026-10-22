//
//  Todo-by-hand.swift
//  TodoListApp
//
//  Created by Filip Vabroušek on 22.10.2026.
//

import SwiftUI


struct Tasky: Identifiable {
    var id = UUID()
    var name: String
}

struct TasksView: View {
    @State var items = [Tasky]()
    @State var text = ""
    
    var body: some View {
        HStack {
           
            VStack {
                Text("Number of tasks \(items.count)")
                
                if items.count < 6 {
                    Text("It is okay")
                } else {
                    Text("Lot's to do")
                }
            }
            // Text how many tasks does repo contain
            // tasks count < 6 => It is okay
            // else a lot to do
            TextField("Enter some tasks", text: $text)
                .padding()
                .border(.orange)
            
            Button("Add task"){
                if text.isEmpty {
                    return
                }
                
                let task = Tasky(name: text)
                items.append(task)
            }
        }
        
        List {
            ForEach(items, id: \.id){ item in
                Text(item.name)
            }
        }
    }
}

#Preview {
    TasksView()
}
