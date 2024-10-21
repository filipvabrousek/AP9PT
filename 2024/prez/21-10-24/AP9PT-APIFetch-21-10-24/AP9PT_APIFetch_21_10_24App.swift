//
//  AP9PT_APIFetch_21_10_24App.swift
//  AP9PT-APIFetch-21-10-24
//
//  Created by student on 21.10.2024.
//

import SwiftUI

class Fetcher: ObservableObject {
    @Published var name = "Filip"
    
}

struct AView: View {
    @EnvironmentObject var fetch: Fetcher
    var body: some View {
        Button("Change name"){
            fetch.name = "Karel"
        }
    }
}

struct BView: View {
    @EnvironmentObject var fetch: Fetcher
    var body: some View {
        Text("Hello \(fetch.name)")
    }
}

struct MainView: View {
    let root = Fetcher()
    var body: some View {
        VStack {
            AView().environmentObject(root)
            BView().environmentObject(root)
        }
    }
}

@main
struct AP9PT_APIFetch_21_10_24App: App {
    var body: some Scene {
        WindowGroup {
           UserList()
        }
    }
}
