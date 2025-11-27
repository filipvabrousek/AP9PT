//
//  Common.swift
//  Multiplatform-27-11-25
//
//  Created by Filip Vabroušek on 27.11.2025.
//

import SwiftUI

struct RootView: View {
    @State var counter = 0
    @State var date: Date = .now
    @State var text = ""
    @State var items = [String]()
    @State var isShown = false
    
    var body: some View {
        
        Group {
            
            #if os(macOS)
            Text("Hello")
                .foregroundStyle(.green)
                .font(.system(size: 60))
            #elseif os(watchOS)
            Text("Hello")
                .foregroundStyle(.orange)
                .font(.system(size: 60))
            #else
            EmptyView()
            #endif
        }
        
        HStack {
            TextField("Enter text", text: $text)
            Button("Add") {
                
                if text.isEmpty {
                    isShown.toggle()
                    return
                }
                
              
                items.append(text)
            }
        }
        
        List(items, id: \.self) { item in
            Text(item)
        }.alert(isPresented: $isShown) {
            Alert(title: Text("Empty text"))
        }
      /*  VStack {
            Text("Multi test")
            
            DatePicker("Pick a date", selection: $date, /*displayedComponents: [.hourAndMinute, .date]*/)
            
            Button("Click me \(counter)"){
                counter += 1
            }
        }//.font(.largeTitle)
       */
    }
}

// iOS, iPadOS, macOS
// watchOS
