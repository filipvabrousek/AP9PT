//
//  ForEach-Simple.swift
//  GuessCircleGame
//
//  Created by Filip Vabroušek on 13.10.2026.
//

import SwiftUI

struct LoopView: View {
    
    @State var correctIndex = Int.random(in: 0..<3)
    @State var showWin = false
    
    var body: some View {
        ScrollView {
            // Show text if user taps correct index
            if showWin {
                    Text("You won")
            }
            
            ForEach(0..<3){ i in
                Text("View \(i)")
                    .padding()
                    .background(.orange)
                    .onTapGesture {
                        if i == correctIndex {
                            showWin.toggle()
                            // showWin = !showWin
                        }
                    }
                // onTapGesture
            }
        }
    }
}

#Preview {
    LoopView()
}
