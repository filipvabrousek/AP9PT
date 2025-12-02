//
//  visionOS_02_12_25_sk2_woimApp.swift
//  visionOS-02-12-25-sk2-woim
//
//  Created by Filip Vabroušek on 02.12.2025.
//

import SwiftUI

@main
struct visionOS_02_12_25_sk2_woimApp: App {
    var body: some Scene {
        WindowGroup {
           ProgrammaticReality()
        }
        
        WindowGroup(id: "mywindow"){
            Text("My new window")
        }
    }
}

