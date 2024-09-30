//
//  ContentView.swift
//  AK9PT-project-1-23-09-24
//
//  Created by student on 23.09.2024.
//

import SwiftUI

struct MyView: View {
    var body: some View {
        
        HStack {
            Text("Hello again.")
                .bold()
                .foregroundStyle(.green)
                //.font(.title)
                .font(.system(size: 20, weight: .heavy))
                .padding() // order matters!
                .border(.orange)
                
            
            Button("Button") {
                print("sth")
            }
        }
    }
}




struct NamedView: View {
    var name: String
    var body: some View {
       Text("Hello \(name)")
            .foregroundStyle(.orange)
            .bold()
    }
}
//  NamedView(name: "Filip")

struct CounterView: View {
    @State var count: Int = 0
    
    var body: some View {
        Button("Count: \(count)"){
            count += 1
        }.font(.title)
    }
}

struct ToggleView: View {
    @State var isOn: Bool = false
    
    var body: some View {
        Button("Hello"){
            isOn.toggle()
        }.font(.title)
            .foregroundStyle(isOn ? .green : .orange)
        
        if (isOn){
            OnlyOnView()
        }
    }
}


struct OnlyOnView: View {
    var body: some View {
        Text("A")
    }
}


struct Parent: View {
    var body: some View {
        VStack {
            Child()
            Child()
            Child()
        }
    }
}


struct Child: View {
    var body: some View {
        Text("Child")
    }
}







#Preview {
    Parent()
  // NamedView(name: "Filip")
}
