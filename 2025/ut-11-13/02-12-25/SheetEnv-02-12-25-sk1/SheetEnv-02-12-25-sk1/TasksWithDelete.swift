//
//  TasksWithDelete.swift
//  SheetEnv-02-12-25-sk1
//
//  Created by Filip Vabroušek on 02.12.2025.
//

import SwiftUI

struct TasksWithDelete: View {
    @State var text = ""
    @State var items = [String]()
    
    var body: some View {
        TextField("Enter text", text: $text)
        Button("+"){
            items.append(text)
        }
        
        List {
            ForEach(items, id: \.self){ item in
                Text(item)
            }.onDelete(perform: deleteItems)
        }
    }
    
    func deleteItems(offsets: IndexSet){
        print(offsets)
        items.remove(atOffsets: offsets)
    }
}
