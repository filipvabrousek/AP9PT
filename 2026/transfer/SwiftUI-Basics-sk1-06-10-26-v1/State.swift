//
//  State.swift
//  SwiftUI-Basics-sk1-06-10-26-v1
//
//  Created by Filip Vabroušek on 06.10.2026.
//

import SwiftUI

struct Counter: View {
    @State var count = 0
    
    var body: some View {
        Button("Counter is \(count)"){
            count += 1
        }.foregroundStyle(count > 3 ? .orange : .green)
            .font(.system(size: 30))
        // counter > 3 make it orange, else green
    }
}

#Preview {
    Counter()
}




