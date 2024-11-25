//
//  AP9PT_visionOS_25_11_24_sk_2App.swift
//  AP9PT-visionOS-25-11-24-sk-2
//
//  Created by Filip Vabroušek on 11/25/24.
//

import SwiftUI

@main
struct AP9PT_visionOS_25_11_24_sk_2App: App {

    @State private var appModel = AppModel()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(appModel)
        }
        
        WindowGroup(id: "hello") {
            Text("Hello window")
        }

        ImmersiveSpace(id: appModel.immersiveSpaceID) {
            ImmersiveView()
                .environment(appModel)
                .onAppear {
                    appModel.immersiveSpaceState = .open
                }
                .onDisappear {
                    appModel.immersiveSpaceState = .closed
                }
        }
        .immersionStyle(selection: .constant(.full), in: .full)
    }
}
