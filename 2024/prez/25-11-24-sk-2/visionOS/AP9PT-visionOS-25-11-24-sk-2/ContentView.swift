//
//  ContentView.swift
//  AP9PT-visionOS-25-11-24-sk-2
//
//  Created by Filip Vabroušek on 11/25/24.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ContentView: View {
    @State var items = [String]()
    @State var text = ""
    @State var isShown = false
    @Environment(\.openWindow) var openWindow
    
    // @Environment(openWindow(id)
    // closeWindow
    
    var body: some View {
        
        VStack {
            Text("Tasks")
                .font(.largeTitle)
            
            TextField("Please enter a task", text: $text)
                .padding()
                .font(.largeTitle)
            
            Button("Open"){
                openWindow(id: "hello")
            }
            
            Button("Add"){
                if text.isEmpty {
                    isShown.toggle()
                } else {
                    items.append(text)
                    text = ""
                }
            }.font(.largeTitle)
            .padding()
            
            
            List(items, id: \.self){ text in
                Text(text)
            }.sheet(isPresented: $isShown) {
                Text("Sheet is here")
                    .font(.largeTitle)
                
                Button("Hello"){
                    
                }.buttonStyle(.borderedProminent)
            }
            
            
            /*.confirmationDialog("Please enter a task", isPresented: $isShown) {
                Button("Ok"){
                    
                }
            }*/
            
            
        }
    }
}

#Preview(windowStyle: .automatic) {
    ContentView()
        .environment(AppModel())
}
