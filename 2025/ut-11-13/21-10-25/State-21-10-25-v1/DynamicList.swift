//
//  DynamicList.swift
//  State-21-10-25-v1
//
//  Created by Filip Vabroušek on 21.10.2025.
//

import SwiftUI

struct DynamicList: View {
    @State var items = [String]()
    @State var text = ""
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                TextField("Add an item", text: $text)
                
                Button("+"){
                    items.append(text)
                    text = ""
                }
            }.padding()
                .border(.green)
            
            List(items, id: \.self) { item in
                Text(item)
            }.listStyle(.plain)
                
            .onAppear {
                print("The view has appeared")
                items.append("Hello")
                items.append("Hello B")
                items.append("Hello C")
            }
        }
    }
}


// Animation and gestures

#Preview {
    DynamicList()
}
