//
//  Game_18_11_24_sk_1App.swift
//  Game-18-11-24-sk-1
//
//  Created by student on 18.11.2024.
//

import SwiftUI

@main
struct Game_18_11_24_sk_1App: App {
    var guesser = Guesser()
    
    var body: some Scene {
        WindowGroup {
            ThreeColumnView()
                .environmentObject(guesser)
        }
    }
}
