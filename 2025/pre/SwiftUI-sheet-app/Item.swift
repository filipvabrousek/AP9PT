//
//  Item.swift
//  SwiftUI-sheet-app
//
//  Created by Filip Vabroušek on 27/11/25.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
