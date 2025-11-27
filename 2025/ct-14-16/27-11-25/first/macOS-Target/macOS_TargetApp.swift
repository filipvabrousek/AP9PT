//
//  macOS_TargetApp.swift
//  macOS-Target
//
//  Created by Filip Vabroušek on 27.11.2025.
//

import SwiftUI

@main
struct macOS_TargetApp: App {
    var body: some Scene {
        WindowGroup {
            RootView()
        }.commands {
            CommandMenu("More"){
                Button("Click me"){
                    print("Click me")
                }
                
                Button("Quit"){
                    NSApplication.shared.terminate(self)
                }
                
                Button("More"){
                    print("Click me for more")
                }
            }
        }
    }
}
