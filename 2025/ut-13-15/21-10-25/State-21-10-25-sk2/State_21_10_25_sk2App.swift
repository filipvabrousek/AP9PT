//
//  State_21_10_25_sk2App.swift
//  State-21-10-25-sk2
//
//  Created by Filip Vabroušek on 21.10.2025.
//

import SwiftUI

@main
struct State_21_10_25_sk2App: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}


struct SimpleState: View {
    @State var isTapped = false
    
    var body: some View {
        VStack {
            Button("Change value"){
                isTapped.toggle()
            }
            
            if isTapped {
                Text("Hello")
            }
            
        }.font(.largeTitle)
    }
}


// Two Buttons A and B
// If I click A => Text("A") is shown and Text("B") is hidden
// button A color is green (other button is orange)

// If I click B => Text("B") is shown and Text("A") is hidden
// button B color is green (other button is orange)

struct ClickerView: View {
    @State var isATapped = false
    @State var isBTapped = false
    
    var body: some View {
        
        VStack {
            HStack {
                Button("A"){
                    isATapped = true
                    isBTapped = false
                }.foregroundStyle(isATapped ? .green : .orange)
                
                Button("B"){
                    isATapped = false
                    isBTapped = true
                }.foregroundStyle(isBTapped ? .green : .orange)
            }
            
            if isATapped {
                Text("A")
            }
            
            if isBTapped {
                Text("B")
            }
            
            
            
            
        }
    }
}


#Preview {
    VStack {
        ClickerView()
        Spacer()
    }.font(.largeTitle)
        .bold()
    
 
}
