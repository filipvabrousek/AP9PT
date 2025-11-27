//
//  watchAppTestApp.swift
//  watchAppTest Watch App
//
//  Created by Filip Vabroušek on 27.11.2025.
//

import SwiftUI

@main
struct watchAppTest_Watch_AppApp: App {
    var body: some Scene {
        WindowGroup {
            CustomView()
        }
    }
}


struct CustomView: View {
    var body: some View {
        Image("whalea")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 120)
    }
}

// 1 - iOS already add target macOS, watchOS, visionOS, tvOS
// 2 - multiplatform add target
// watchOS, tvOS (macOS is included)


