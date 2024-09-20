//
//  ContentView.swift
//  AP9PT
//
//  Created by Filip Vabroušek on 20.09.2024.
//

import SwiftUI

struct MyView: View {
    var body: some View {
        VStack {
            Text("Hello")
                .bold()
            
            Text("Hello")
                .bold()
        }.font(.largeTitle)
        
        
        HStack {
            Text("Hello")
                .bold()
            
            Text("Hello")
                .bold()
        }.font(.largeTitle)
        
    }
}


struct CounterView: View {
    @State var count = 0
    
    var body: some View {
        VStack {
            Text("Counter \(count)")
            
            Button("Increment") {
                count += 1
            }
            
            Text("Second")
        }.font(.largeTitle)
    }
}



struct ToDoView: View {
    @State var items = [String]()
    @State var item: String = ""
    
    var body: some View {
        VStack {
            
            HStack {
                TextField("Enter an item", text: $item)
                
                Button("+"){
                    items.append(item)
                }
            }
            
            List(items, id: \.self){ item in
                Text(item)
            }
        }
    }
}















struct RootView: View {
    var body: some View {
       // MyView()
       // CounterView()
        
        ToDoView()
    }
}


#Preview {
   // CounterView()
    
    ToDoView()
}




