//
//  SwiftUIBasics_30_09_24_sk_1App.swift
//  SwiftUIBasics-30-09-24-sk-1
//
//  Created by student on 30.09.2024.
//

import SwiftUI

@main
struct SwiftUIBasics_30_09_24_sk_1App: App {
    var body: some Scene {
        WindowGroup {
         // MyViewa()
            //ParentView()
         //   CounterView()
           // ToggleView()
            // SpacedViewa()
          //  ToDoView()
            ShapeView()
        }
    }
}

struct MyView: View {
    var body: some View {
        Text("Hello")
            .bold()
            .italic()
            .font(.largeTitle)
            .strikethrough()
            .foregroundStyle(.orange)
            .border(Color.orange, width: 3)
            .padding()
        
    }
}


struct MyViewa: View {
    var body: some View {
        HStack(spacing: 20) {
            Text("First")
                .font(.largeTitle)
            
            Text("Second")
                .font(.largeTitle)
        }.border(.green)

    }
}



struct ParentView: View {
    var body: some View {
        VStack {
            Text("Hello")
            ChildView()
        }
    }
}

struct ChildView: View {
    var body: some View {
            Text("Child")
    }
}

// -----------------------------------------

struct CounterView: View {
    @State var counter = 0
    
    var body: some View {
        Button("Count \(counter)"){
            counter += 1
        }
        .font(.title)
    }
}


struct ToggleView: View {
    @State var isOn = false
    
    var body: some View {
        Button("Toggle \(isOn ? "On" : "Off")"){
            isOn.toggle()
        }
        .font(.title)
        .foregroundStyle(isOn ? .green : .orange)
        
        if isOn {
            Text("Currently is on")
        } else {
            Text("Currently is off")
        }
        
        // better way, view identity is the same
       // Text(isOn ? "Currently is on" : "Currently is off")
    }
}







struct SpacedView: View {
    var body: some View {
            
       /* HStack {
            Spacer()
            Text("Child")
        }*/
        
        VStack(alignment: .leading) {
            Text("This is child")
            Text("Hello")
        }.font(.title)
        
        //.frame(width: 400)
        
       
    }
}


