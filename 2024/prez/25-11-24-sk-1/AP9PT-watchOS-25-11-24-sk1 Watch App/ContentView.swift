//
//  ContentView.swift
//  AP9PT-watchOS-25-11-24-sk1 Watch App
//
//  Created by student on 25.11.2024.
//

import SwiftUI

struct ContentView: View {
    @State var value = 0.0
    var body: some View {
        
        Text("\(value)")
        
        Stepper {
            Label {
                
            } icon: {
                Image(systemName: "figure.walk")
            }
        } onIncrement: {
            value += 1
        }
        onDecrement: {
            value -= 1
        }
        onEditingChanged: { val in
            print(val)
        }
    }
}


struct ListView: View {
    @State var items = (0...100).map {"Item \($0)"}
    
    var body: some View {
        List(items, id: \.self) { item in
            Text(item).swipeActions {
                Button {
                    
                } label: {
                    Label {
                        Text("Hello")
                    } icon: {
                        Label("Read", systemImage: "envelope.open")
                    }

                }
            }
                
        }
    }
}

#Preview {
    ContentView()
}
