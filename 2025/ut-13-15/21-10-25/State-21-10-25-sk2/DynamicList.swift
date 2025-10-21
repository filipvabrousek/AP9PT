//
//  DynamicList.swift
//  State-21-10-25-sk2
//
//  Created by Filip Vabroušek on 21.10.2025.
//

import SwiftUI

struct TasksView: View {
    @State var text = ""
    @State var items = [String]()
    
    var body: some View {
        VStack(alignment: .leading) {
            
            
            HStack {
                TextField("Enter your task", text: $text)
                Button("+"){
                    items.append(text)
                    text = ""
                }
            }.padding()
            
            
            List(items, id: \.self) { item in
                Text(item)
            }.listStyle(.plain)
            
            
        }
        
    }
}

// Navigation
// State

#Preview {
    VStack {
        
        
        TasksView()
        Spacer()
    }
}
