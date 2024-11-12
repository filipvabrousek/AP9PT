//
//  GridTest_12_11_24_sk2App.swift
//  GridTest-12-11-24-sk2
//
//  Created by student on 12.11.2024.
//

import SwiftUI

@main
struct GridTest_12_11_24_sk2App: App {
    let guesser = Guesser()
    
    var body: some Scene {
        WindowGroup {
            TwoColumnView()
                .environmentObject(guesser)
        }
    }
}
