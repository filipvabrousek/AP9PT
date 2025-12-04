//
//  DeleteRow_04_12_25_sk1App.swift
//  DeleteRow-04-12-25-sk1
//
//  Created by Filip Vabroušek on 04.12.2025.
//

import SwiftUI

@main
struct DeleteRow_04_12_25_sk1App: App {
    var body: some Scene {
        WindowGroup {
           Tasks()
        }
    }
}

struct Tasks: View {
    @State var tasks = [String]()
    @State var text = ""
    
    var body: some View {
        TextField("Add some task", text: $text)
        
        Button("Add text"){
            tasks.append(text)
            text = ""
        }
        
        List {
            ForEach(tasks, id: \.self){ task in
                Text(task)
            }.onDelete(perform: deleteItems)
        }
        
        
    }
    
    func deleteItems(at offsets: IndexSet) {
        print(offsets.rangeView.startIndex) // index of item to be deleted
        tasks.remove(atOffsets: offsets)
    }
}
