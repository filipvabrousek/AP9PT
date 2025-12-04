//
//  visionOS_app_04_12_25_sk1App.swift
//  visionOS-app-04-12-25-sk1
//
//  Created by Filip Vabroušek on 04.12.2025.
//

import SwiftUI

@main
struct visionOS_app_04_12_25_sk1App: App {

    @State private var appModel = AppModel()

    var body: some Scene {
        WindowGroup {
            ProgrammaticReality()
        }
        
        WindowGroup(id: "mywindow"){
            Text("My window")
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





