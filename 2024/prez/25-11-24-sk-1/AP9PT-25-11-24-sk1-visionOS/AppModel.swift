//
//  AppModel.swift
//  AP9PT-25-11-24-sk1-visionOS
//
//  Created by Filip Vabroušek on 11/25/24.
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
