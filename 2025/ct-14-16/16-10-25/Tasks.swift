//
//  Tasks.swift
//  State-16-10-25-sk-2
//
//  Created by Filip Vabroušek on 16.10.2025.
//

import SwiftUI

struct Tasks: View {
    @State var task = ""
    @State var tasks = [String]()
    
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Tasks")
                .font(.largeTitle)
                .bold()
                .foregroundStyle(.blue)
                .padding()
            
            HStack {
                // TextField("Enter a task", text: .constant("Some task"))
                
                TextField("Enter a task", text: $task)
                
                Button(
                "+"
                ){
                    if task.isEmpty {
                        return
                    }
                    
                    tasks.append(task)
                    task = ""
                }
            }.padding()
            
            List(tasks, id:\.self) { task in
                Text(task)
            }.listStyle(.plain)
        }
    }
}

#Preview {
    Tasks()
}
