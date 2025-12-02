//
//  Item.swift
//  persistent-02-12-25-sk2
//
//  Created by Filip Vabroušek on 02.12.2025.
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
