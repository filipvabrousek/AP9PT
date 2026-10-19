//
//  BoundCircle.swift
//  15-10-26-sk1
//
//  Created by Filip Vabroušek on 15.10.2026.
//

import SwiftUI

struct OurGuesser: View {
    @State var index = Int.random(in: 0..<3)
    // 3 boxes, user will tap each one and try to tap the box with the correct index
    // FoeEach
    
    @State var showWinTitle = false
    
    var body: some View {
        ScrollView {
            
           
            
            VStack {
                if showWinTitle {
                    Text("You win")
                        .font(.largeTitle)
                        .foregroundStyle(.green)
                }
                
                ForEach(0..<3){ i in
                    Text("Box \(i)")
                        .padding()
                        .background(.orange)
                        .font(.largeTitle)
                        .onTapGesture {
                            if i == index {
                                showWinTitle = true
                            } else {
                                showWinTitle = false
                            }
                        }
                }
                // onTapGesture {   }
            }
            
        }
        
    }
}

#Preview {
    OurGuesser()
}
