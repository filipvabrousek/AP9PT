//
//  ContentView.swift
//  macTestApp
//
//  Created by student on 15.10.2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

class Task: Hashable {
    var title: String
    var date: Date
    
    init(title: String, date: Date){
        self.title = title
        self.date = date
    }
    
    static func == (lhs: Task, rhs: Task) -> Bool {
        lhs.date == rhs.date
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(date)
    }
}


struct TaskView: View {
    @State var tasks = [Task]()
    @State var text = ""
    @State var showAlert = false
    
    var body: some View {
        VStack {
            
            HStack {
                TextField("Enter a task", text: $text)
                
                Button("+"){
                    if text.isEmpty {
                        showAlert.toggle()
                    } else {
                        let task = Task(title: text, date: .now)
                        tasks.append(task)
                        text = ""
                    }
                }
            }.padding()
           
            List(tasks, id: \.self){ task in
                Text(task.title)
            }
            
        }.alert(isPresented: $showAlert) {
            Alert(title: Text("Please enter some text"), dismissButton: .cancel())
        }
    }
}


#Preview {
    ContentView()
}
