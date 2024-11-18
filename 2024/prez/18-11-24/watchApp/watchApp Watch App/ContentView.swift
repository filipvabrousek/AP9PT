//
//  ContentView.swift
//  watchApp Watch App
//
//  Created by student on 18.11.2024.
//

import SwiftUI

struct ContentView: View {
    @State var value = 0.0
    
    var body: some View {
        
        VStack {
          //  Slider(value: $value)
            Text("\(value)")
                .font(value > 10 ? .system(size: 23): .system(size: 12))
            
            Stepper {
                Label {
                   
                } icon: {
                   // Image(systemName: "figure.walk.treadmill")
                   Image(systemName: "figure.walk")
                }

            } onIncrement: {
               value += 1
            } onDecrement: {
                value -= 1
            } onEditingChanged: { val in
                print(val)
            }

        }
        
                // UIHostingController
                // UIViewRepresentable
                
        
        /*List {
            ForEach(0..<1000) { val in
                Text("\(val)")
            }
        }*/
        
        
    }
}

#Preview {
    ContentView()
}
