//
//  macTestApp.swift
//  macTest
//
//  Created by student on 14.10.2024.
//

import SwiftUI

class SharedData: ObservableObject {
    @Published var counter = 0
}

@main
struct macTestApp: App {
    var body: some Scene {
        WindowGroup {
            TasksView()
           // AView()
               // .environmentObject(SharedData())
        }
    }
}
