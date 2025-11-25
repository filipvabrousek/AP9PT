//
//  mactargetApp.swift
//  mactarget
//
//  Created by Filip Vabroušek on 25.11.2025.
//

import SwiftUI

@main
struct mactargetApp: App {
    var body: some Scene {
        WindowGroup {
            Tasks()
            
        }.commands {
            CommandMenu("Add item") {
                Button("Print add item"){
                    print("Hello")
                }
                
                Button("Quit"){
                    NSApplication.shared.terminate(self)
                }
            }
        }
    }
}
