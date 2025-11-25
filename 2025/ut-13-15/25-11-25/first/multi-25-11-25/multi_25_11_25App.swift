//
//  multi_25_11_25App.swift
//  multi-25-11-25
//
//  Created by Filip Vabroušek on 25.11.2025.
//

import SwiftUI

@main
struct multi_25_11_25App: App {
    var body: some Scene {
        WindowGroup {
            SimpleView()
        }.commands {
            CommandMenu("File") {
                Button("Quit") {
                  //  NSApplication.shared.terminate(self)
                }
                
                Button("Next"){
                    print("Hello")
                }
                
                Button("Project"){
                    print("Project")
                }
            }
        }
    }
}
