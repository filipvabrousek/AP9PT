//
//  ContentView.swift
//  API-Test-21-10-24
//
//  Created by student on 21.10.2024.
//

import SwiftUI


class MyObservable: ObservableObject {
    @Published var name = "Filip"
}

struct RootView: View {
    let myo = MyObservable()
    var body: some View {
        VStack {
            AView()
                .environmentObject(myo)
            BView()
                .environmentObject(myo)
        }.font(.largeTitle)
    }
}

struct AView: View {
    @EnvironmentObject var myo: MyObservable
    
    var body: some View {
        Button("Set name"){
            myo.name = "Eda"
        }
    }
}

struct BView: View {
    @EnvironmentObject var myo: MyObservable
    
    var body: some View {
        Text("Name: \(myo.name)")
    }
}

struct ContentView: View {
    var body: some View {
       Text("API")
    }
}

#Preview {
    ContentView()
}
