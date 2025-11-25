//
//  Shared.swift
//  multi-25-11-25
//
//  Created by Filip Vabroušek on 25.11.2025.
//

import SwiftUI

struct SimpleView: View {
    @State var date: Date = .now
    @State var items = [String]()
    
    var body: some View {
        VStack {
            #if os(watchOS)
            Text("Hello").foregroundStyle(.orange)
            #else
            Text("Hello").foregroundStyle(.green)
            #endif
            Button("Click me"){
                items.append("New item")
            }
            
            DatePicker("Select a date", selection: $date)
            
            List(items, id: \.self) { item in
                Text(item)
            }
            
        }.font(.largeTitle)
    }
}

