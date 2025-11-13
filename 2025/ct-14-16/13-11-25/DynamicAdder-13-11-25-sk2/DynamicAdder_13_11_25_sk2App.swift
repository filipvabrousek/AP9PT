//
//  DynamicAdder_13_11_25_sk2App.swift
//  DynamicAdder-13-11-25-sk2
//
//  Created by Filip Vabroušek on 13.11.2025.
//

import SwiftUI

@main
struct DynamicAdder_13_11_25_sk2App: App {
    var body: some Scene {
        WindowGroup {
            RootView()
        }
    }
}

struct RootView: View {
    let store = Store()
    
    var body: some View {
        TabView {
            ContentView()
                .environmentObject(store)
                .tabItem {
                    Image(systemName: "sun.min.fill")
                }
            
               DetailView()
                .environmentObject(store)
                .tabItem {
                    Image(systemName: "cloud")
                }
        }
    }
}

struct DetailView: View {
    @EnvironmentObject var store: Store
    
    var body: some View {
        Text("User has \(store.items.count) \(store.items.count == 1 ? "item" : "items")")
        
            .font(.largeTitle)
            .bold()
    }
}
