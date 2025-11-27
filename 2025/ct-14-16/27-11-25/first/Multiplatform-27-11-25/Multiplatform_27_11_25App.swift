//
//  Multiplatform_27_11_25App.swift
//  Multiplatform-27-11-25
//
//  Created by Filip Vabroušek on 27.11.2025.
//

import SwiftUI

@main
struct Multiplatform_27_11_25App: App {
    var body: some Scene {
        WindowGroup {
            MatchedGeo()
            //RootView()
        }.commands {
            CommandMenu("More"){
                Button("Click me"){
                    print("Click me")
                }
                
                Button("Quit"){
                   // NSApplication.shared.terminate(self)
                }
                
                Button("More"){
                    print("Click me for more")
                }
            }
        }
    }
}
    
