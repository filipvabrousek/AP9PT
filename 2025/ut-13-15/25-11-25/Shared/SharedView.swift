//
//  SharedView.swift
//  multi-multi-25-11-25-sk2
//
//  Created by Filip Vabroušek on 25.11.2025.
//

import SwiftUI

struct SharedView: View {
    @State var counter = 0
    @State var date: Date = .now
    
    var body: some View {
        VStack {
            Text("Shared")
            
            Button("Count \(counter)"){
                counter += 1
            }
            
            DatePicker("Pick a date", selection: $date)
            
        }.font(.largeTitle)
    }
}

struct Tasks: View {
    @State var items = [String]()
    @State var item = ""
    @State var isShown = false
    
    var body: some View {
        VStack {
            
            #if os(macOS)
            Text("Tasks")
                .foregroundStyle(.orange)
                .font(.largeTitle)
            
            #elseif os(watchApp_Watch_AppApp)
            HStack {
                Text("Tasks")
                    .foregroundStyle(.blue)
                    .font(.largeTitle)
                
                Button {
                    
                } label: {
                    Label("add", systemImage: "plus")
                }
            }
         
            #else
            Text("Tasks")
                .foregroundStyle(.green)
                .font(.largeTitle)
            #endif
            
            
            TextField("Enter some text", text: $item)
            
            Button("Add"){
                if item.isEmpty {
                    isShown.toggle()
                    return
                }
                
                items.append(item)
            }.alert(isPresented: $isShown) {
                Alert(title: Text("Sth wen wrong"))
            }
            
            List(items, id: \.self) { item in
                Text(item)
            }
            
            
            
        }
    }
}
