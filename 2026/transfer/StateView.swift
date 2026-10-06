//
//  StateView.swift
//  05-10-26-sk1-FirstApp
//
//  Created by Filip Vabroušek on 05.10.2026.
//

import SwiftUI

struct StateView: View {
    @State var count = 0
    
    var body: some View {
        Button("Counter is \(count)"){
            count += 1
        }.foregroundStyle(count > 3 ? .green : .orange)
        
        // counter > 3 change button color
    }
}


struct StyledView: View {
    var body: some View {
         Text("Styled")
            .font(.largeTitle)
                .foregroundStyle(.orange)
                .font(.system(size: 80))
                .foregroundStyle(.green)
        
    }
}

#Preview {
    StateView()
   // StyledView()
}
