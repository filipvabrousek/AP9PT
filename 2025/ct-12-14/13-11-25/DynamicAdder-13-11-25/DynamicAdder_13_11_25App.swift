//
//  DynamicAdder_13_11_25App.swift
//  DynamicAdder-13-11-25
//
//  Created by Filip Vabroušek on 13.11.2025.
//

import SwiftUI
import Combine

@main
struct DynamicAdder_13_11_25App: App {
    var body: some Scene {
        WindowGroup {
            RootView()
        }
    }
}


class Controller: ObservableObject {
    @Published var items: [Post] = []
    
    func addPost(post: Post){
        items.append(post)
    }
}
 

struct RootView: View {
    let controller = Controller()
    
    var body: some View {
        TabView {
            ContentView()
                .tabItem {
                    Image(systemName: "sun.min.fill")
                }
                .environmentObject(controller)

            OtherView()
                .tabItem {
                    Image(systemName: "house")
                }
                .environmentObject(controller)
        }
    }
}

struct OtherView: View {
    @EnvironmentObject var controller: Controller
    
    var body: some View {
        Text("Hello User you have \(controller.items.count) posts")
    }
}
