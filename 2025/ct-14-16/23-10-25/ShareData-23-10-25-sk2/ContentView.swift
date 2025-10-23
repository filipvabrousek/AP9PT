//
//  ContentView.swift
//  ShareData-23-10-25-sk2
//
//  Created by Filip Vabroušek on 23.10.2025.
//

import SwiftUI


struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

// @State view
// Text and Button
// if i % 2 == 0 green : blue
// font weight bold even : odd => font weight black

struct CounterView: View {
    @State var i = 0
    
    var body: some View {
        
        Group {
            
            
            Text("Hello")
                .foregroundStyle(i % 2 == 0 ? .green : .blue)
                .fontWeight(i % 2 == 0 ? .bold : .black)
            
            Button("Count \(i)"){
                i += 1
            }
        }.font(.largeTitle)
    }
}

#Preview {
    CounterView()
}




#Preview {
    ContentView()
}
