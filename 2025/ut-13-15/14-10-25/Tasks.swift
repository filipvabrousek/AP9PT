//
//  Tasks.swift
//  State-14-10-25-sk-2
//
//  Created by Filip Vabroušek on 14.10.2025.
//

import SwiftUI

struct Tasks: View {
    @State var text = ""
    @State var items = [String]()
    
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Tasks")
                .foregroundStyle(.blue)
                .bold()
            
          //  TextField("Enter a task", text: .constant("Sample"))
            
            HStack {
                TextField("Enter a task", text: $text)
                Button("+"){
                    
                    if text.isEmpty {
                        return
                    }
                    
                    items.append(text)
                    text = ""
                }
            }
            
            List(items, id: \.self){ item in
                Text(item)
            }
           
        }.font(.largeTitle)
    }
}

#Preview {
    Tasks()
}

