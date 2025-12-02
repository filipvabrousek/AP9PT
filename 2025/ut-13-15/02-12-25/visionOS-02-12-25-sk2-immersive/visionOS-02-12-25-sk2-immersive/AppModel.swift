//
//  AppModel.swift
//  visionOS-02-12-25-sk2-immersive
//
//  Created by Filip Vabroušek on 02.12.2025.
//

import SwiftUI

/// Maintains app-wide state
@MainActor
@Observable
class AppModel {
    let immersiveSpaceID = "ImmersiveSpace"
    enum ImmersiveSpaceState {
        case closed
        case inTransition
        case open
    }
    var immersiveSpaceState = ImmersiveSpaceState.closed
}
