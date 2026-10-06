//
//  StateTest.swift
//  first-app-06-10-26-sk-2
//
//  Created by Filip Vabroušek on 06.10.2026.
//

import SwiftUI

struct StateView: View {
    @State var count = 0
    
    var body: some View {
        Button("Counter \(count)"){
            count += 1
        }.font(.system(size: 30))
            .foregroundStyle(count > 3 ? .green : .orange)
        
        if count > 3 {
            Circle().foregroundStyle(.green)
                .frame(width: 30)
        }
        
        // if value > 3 make font green else orange
    }
}

#Preview {
    StateView()
}
