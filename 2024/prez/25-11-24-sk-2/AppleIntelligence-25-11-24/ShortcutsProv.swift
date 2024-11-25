//
//  ShortcutsProv.swift
//  AppleIntelligence-25-11-24
//
//  Created by student on 25.11.2024.
//

import AppIntents

@available(iOS 18.0, *)
struct ShortcutsProvider: AppShortcutsProvider {
    static var appShortcuts: [AppShortcut] {
        AppShortcut(intent: TaskNumberIntent(),
                    phrases: ["My task number"],
                    shortTitle: "Task number", systemImageName: "sparkle.magnifyingglass")
    }
    
    static var shortcutTileColor: ShortcutTileColor = .orange
}
