//
//  visionOS_kombi_test_15_11_24App.swift
//  visionOS-kombi-test-15-11-24
//
//  Created by Filip Vabroušek on 11/15/24.
//

import SwiftUI

@main
struct visionOS_kombi_test_15_11_24App: App {

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
