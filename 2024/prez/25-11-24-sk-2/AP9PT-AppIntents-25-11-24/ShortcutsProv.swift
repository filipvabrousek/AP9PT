//
//  ShortcutsProv.swift
//  AP9PT-AppIntents-25-11-24
//
//  Created by Filip Vabroušek on 11/25/24.
//

import AppIntents

@available(macCatalyst 18.0, iOS 18.0, *)
struct ShortuctsProvider: AppShortcutsProvider { // Neither struct nor class works
    static var appShortcuts: [AppShortcut] {
        AppShortcut(intent: TaskNumberIntent(),
                    phrases: ["Tasks number mine"],
                    shortTitle: "Tasks number",
                    systemImageName: "sparkle.magnifyingglass")
    }
    
    static var shortcutTileColor: ShortcutTileColor = .orange
}
