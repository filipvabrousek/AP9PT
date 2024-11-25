//
//  AP9PT_25_11_24_sk1_visionOSApp.swift
//  AP9PT-25-11-24-sk1-visionOS
//
//  Created by Filip Vabroušek on 11/25/24.
//

import SwiftUI

@main
struct AP9PT_25_11_24_sk1_visionOSApp: App {

    @State private var appModel = AppModel()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(appModel)
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
