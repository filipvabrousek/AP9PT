//
//  State_21_10_25_v1App.swift
//  State-21-10-25-v1
//
//  Created by Filip Vabroušek on 21.10.2025.
//

import SwiftUI

@main
struct State_21_10_25_v1App: App {
    var body: some Scene {
        WindowGroup {
           GestureView()
        }
    }
}



struct StateReviseView: View {
    @State var stateRevise: Bool = false
    
    var body: some View {
        VStack {
            Button("Show a view"){
                stateRevise.toggle()
            }
            
            if stateRevise {
                Text("Hidden view")
            }
            
            Spacer()
        }.font(.largeTitle)
    }
}


// Two buttons A B
// If I click A => Text("A") is shown and Text("B") is hidden
// button A color is green (other button orange)

// If I click B => Text("B") is shown and Text("A") is hidden
// button B color is green (other button orange)

struct MyState: View {
    @State var isAShown: Bool = false
    
    @State var isBShown: Bool = false
    
    var body: some View {
        HStack {
            Button("A"){
                isAShown = true
                isBShown = false
            }.foregroundStyle(isAShown ? .green : .orange)
            
            Button("B"){
                isAShown = false
                isBShown = true
            }.foregroundStyle(isBShown ? .green : .orange)
        }
        
        
        if isAShown {
                Text("A is shown")
        }
        
        if isBShown {
                Text("B is shown")
        }
    }
}






#Preview {
    VStack {
        MyState()
    Spacer()
    }.font(.largeTitle)
        .bold()
}
