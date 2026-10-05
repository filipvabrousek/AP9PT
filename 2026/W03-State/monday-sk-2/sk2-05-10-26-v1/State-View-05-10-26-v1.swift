//
//  State-View-05-10-26-v1.swift
//  sk2-05-10-26-v1
//
//  Created by Filip Vabroušek on 05.10.2026.
//

import SwiftUI

struct StateView: View {
    @State var counter = 0
    var body: some View {
        Button("Counter \(counter)"){
            counter += 1
        }.font(.system(size: 30))
         .foregroundStyle(counter > 3 ? .green : .orange)
        // counter > 3? change color to green
        
        if counter > 3 && counter < 10 {
            Circle().foregroundStyle(.green)
                .frame(width: 30, height: 30)
        }
    }
}

#Preview {
    StateView()
}


