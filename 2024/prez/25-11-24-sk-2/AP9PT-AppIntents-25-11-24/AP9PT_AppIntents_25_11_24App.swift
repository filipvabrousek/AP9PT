//
//  AP9PT_AppIntents_25_11_24App.swift
//  AP9PT-AppIntents-25-11-24
//
//  Created by Filip Vabroušek on 11/25/24.
//

import SwiftUI

@main
struct AP9PT_AppIntents_25_11_24App: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(Passer())
        }
    }
}
