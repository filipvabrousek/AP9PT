//
//  Tasks.swift
//  State-16-10-25-sk-1
//
//  Created by Filip Vabroušek on 16.10.2025.
//

import SwiftUI

struct Tasks: View {
    @State var text = ""
    @State var tasks = [String]()
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Tasks")
                .bold()
                .foregroundStyle(.blue)
                .padding()
                .font(.largeTitle)
            
            HStack {
                TextField("Enter a task", text: $text)
                    .padding()
              // TextField("Enter a task", text: .constant("Placeholder"))
                
                 Button("+"){
                    if text.isEmpty {
                         return
                     }
                     
                     tasks.append(text)
                     text = ""
                }
            }.padding()
            
            List(tasks, id: \.self) { task in
                CellView(text: task)
            }.listStyle(.plain)
        }
    }
}


struct CellView: View {
    var text: String
    
    var body: some View {
        Text(text)
            .bold()
    }
}

#Preview {
    Tasks()
}
