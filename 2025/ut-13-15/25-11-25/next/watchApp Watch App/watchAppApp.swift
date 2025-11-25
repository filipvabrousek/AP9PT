//
//  watchAppApp.swift
//  watchApp Watch App
//
//  Created by Filip Vabroušek on 25.11.2025.
//

import SwiftUI

@main
struct watchApp_Watch_AppApp: App {
    var body: some Scene {
        WindowGroup {
        
                
                
                WatchTasks()
            
        }
    }
}


struct WatchTasks: View {
    @State var items = [String]()
    @State var item = ""
    @State var isShown = false
    
    var body: some View {
        VStack {
            
            
            Text("Tasks")
                .foregroundStyle(.green)
                .font(.largeTitle)
            
            
            HStack {
                
                
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
            }
            List(items, id: \.self) { item in
                Text(item)
            }
            
            
            
        }
    }
}


