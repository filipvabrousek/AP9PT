//
//  ForEachFile.swift
//  CircleGuess
//
//  Created by Filip Vabroušek on 12.10.2026.
//

import SwiftUI

struct LoopView: View {
    @State private var correctIndex = Int.random(in: 0..<3)
    @State var show = false
    
    var body: some View {
        ScrollView {
            if show {
                Text("You won")
            }
            
            ForEach(0..<3){ index in
                Text("Index is \(index)")
                    .padding()
                    .background(.orange)
                    .onTapGesture {
                        if correctIndex == index {
                            show.toggle()
                        }
                    }
            }
        }
        
       
    }
}

#Preview {
    LoopView()
}
