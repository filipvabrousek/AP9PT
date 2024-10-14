//
//  ContentView.swift
//  AppIconTest
//
//  Created by student on 14.10.2024.
//

import SwiftUI


struct RootView: View {
    let myo = MyObservable()
    var body: some View {
        ViewA()
            .environmentObject(MyObservable())
    }
}

struct ViewA: View {
    @EnvironmentObject var observed: MyObservable
    
    var body: some View {
        VStack {
            Text("View A")
            
            Button("Change") {
                observed.counter += 1
            }
            
            
            ViewB()
            //  @EnvironmentObject var observed: MyObservable
            
           // ViewB(observed: observed)
            // @ObservedObject var observed: MyObservable need to pass it
        }.font(.largeTitle)
    }
}


struct ViewB: View {
    @EnvironmentObject var observed: MyObservable // ViewB()
    // @ObservedObject var observed: MyObservable //  ViewB(observed: observed)
    
    var body: some View {
        VStack {
            Text("View B")
            
            Text("Counter is \(observed.counter)")
        }
    }
}


struct ContentView: View {
    @EnvironmentObject var observed: MyObservable
    
    var body: some View {
        VStack {
            Text("View A")
            
            Button("Change") {
                observed.counter += 1
            }
        }
    }
}

#Preview {
    ContentView()
}
