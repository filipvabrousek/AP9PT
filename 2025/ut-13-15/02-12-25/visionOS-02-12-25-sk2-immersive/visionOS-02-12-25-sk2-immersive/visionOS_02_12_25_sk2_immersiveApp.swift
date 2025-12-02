//
//  visionOS_02_12_25_sk2_immersiveApp.swift
//  visionOS-02-12-25-sk2-immersive
//
//  Created by Filip Vabroušek on 02.12.2025.
//

import SwiftUI

@main
struct visionOS_02_12_25_sk2_immersiveApp: App {

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
