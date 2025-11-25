//
//  MultiNext.swift
//  real-multi-25-11-25
//
//  Created by Filip Vabroušek on 25.11.2025.
//
import SwiftUI

struct MultiView: View {
    @State var items = [String]()
    @State var item = ""
    @State var isShown = false
    
    var body: some View {
        TextField("Enter some text", text: $item)
        Button("Add an item"){
            if item.isEmpty {
                isShown.toggle()
                return
            }
            
            items.append(item)
        }.alert(isPresented: $isShown) {
           Alert(title: Text("Ok"))
        }

        // to-do list
        List(items, id: \.self) { item in
            Text(item)
        }
    }
}


struct NavView: View {
    var body: some View {
        NavigationStack {
            NavigationLink(destination: MultiView()) {
                Text("To-do list")
                    .navigationTitle("Multi")
            }
            
            NavigationLink(destination: Text("Hello")) {
                Text("To-do list")
                    .navigationTitle("Hello")
                
            }
            
            NavigationLink(destination: Text("Cool")) {
                Text("To-do list")
                    .navigationTitle("Cool")
            }
        }
    }
}

