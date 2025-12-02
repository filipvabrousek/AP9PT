//
//  persistent_02_12_25_sk2App.swift
//  persistent-02-12-25-sk2
//
//  Created by Filip Vabroušek on 02.12.2025.
//

import SwiftUI
import SwiftData

@main
struct persistent_02_12_25_sk2App: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Item.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(sharedModelContainer)
    }
}
