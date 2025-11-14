//
//  State.swift
//  SwiftUITest
//
//  Created by Filip Vabroušek on 14.11.2025.
//

import SwiftUI

struct HelloState: View {
     @State var count = 0
    
    var body: some View {
        Button("Count: \(count)"){
            count += 1
        }.font(.largeTitle)
            .foregroundStyle(count >= 3 ? .green : .orange)
        
        
        if count > 3 {
            Text("Count is bigger than 3")
        }
    }
}

#Preview {
    HelloState()
}
