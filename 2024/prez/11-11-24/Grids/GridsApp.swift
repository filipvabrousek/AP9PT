//
//  GridsApp.swift
//  Grids
//
//  Created by student on 11.11.2024.
//

import SwiftUI

@main
struct GridsApp: App {
    let g = Guesser()
    
    var body: some Scene {
        WindowGroup {
           TwoColumnView()
                .environmentObject(g)
        }
    }
}
