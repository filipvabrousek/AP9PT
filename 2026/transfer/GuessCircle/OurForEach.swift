//
//  OurForEach.swift
//  GuessCircle
//
//  Created by Filip Vabroušek on 13.10.2026.
//

import SwiftUI

struct OurEach: View {
    
    @State var correctIndex = Int.random(in: 0..<3)
    @State var isCorrect = false
    
    var body: some View {
        
    ScrollView {
        // Show success text here
        if isCorrect {
            Text("You win!")
        }
        
        ForEach(0..<3){ i in
            Text("Text \(i)")
                .padding()
                .background(.orange)
                .onTapGesture {
                    print("Tapped")
                    
                    if i == correctIndex {
                        isCorrect.toggle()
                    }
                }
            
            // onTapGesture
        }
    }
    }
}

#Preview {
    OurEach()
}
