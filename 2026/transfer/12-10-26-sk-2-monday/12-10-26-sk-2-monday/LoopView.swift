//
//  LoopView.swift
//  12-10-26-sk-2-monday
//
//  Created by Filip Vabroušek on 12.10.2026.
//

import SwiftUI

struct LoopView: View {
    var body: some View {
        ScrollView {
            ForEach(0..<3000, id: \.self){ id in
                Text("Item \(id)")
            }
        }
    }
}

#Preview {
    LoopView()
}
