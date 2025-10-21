//
//  Animation.swift
//  State-21-10-25-v1
//
//  Created by Filip Vabroušek on 21.10.2025.
//

import SwiftUI

struct Animation: View {
    @State var rotate: Double = 0
    var rotationLimit: Double = 60
    
    var body: some View {
        VStack {
            // extraBounce = 0.6
            // animation never stops, because rotation limit is being overshot because of high extraBounce (limit = 0.3)
            Button("Rotate"){
                withAnimation(.bouncy(duration: 0.3, extraBounce: 0.69)) {
                    rotate == rotationLimit ? (rotate = 0) : (rotate = rotationLimit)
                }
            }
            
            Text("Hello, World!")
                .rotationEffect(.degrees(rotate))
                .foregroundStyle(rotate > rotationLimit / 2 ? .green : .orange)
                .bold()
                .font(rotate > rotationLimit / 2 ? .system(size: 30, weight: .medium) : .system(size: 40, weight: .black))
                
        }
           
    }
}



struct GestureView: View {
    @State var showAfterTrippleTap = false
    
    var body: some View {
        VStack {
            Text("Hello").onTapGesture {
                print("Tapped")
            }
            
            Text("Triple tap")
                .onTapGesture(count: 3) {
                print("Tripple tap")
                    showAfterTrippleTap.toggle()
                    
            }
            
            
            if showAfterTrippleTap {
                Text("After tripple tapc")
            }
            // rotationGesture for rotation
        }
    }
}

// View extension
// View modifiers

// Make one style library for text styling
// extension View {}
// .shadow
// .fill(gradient)


struct StyledView: View {
    var body: some View {
        Text("Styled")
            .styled()
        
        Text("Cool")
            .styled()
    }
}

extension View {
    func styled() -> some View {
        self
            .font(.largeTitle)
            .bold()
            .foregroundStyle(.green)
            .shadow(color: .orange, radius: 21/3)
            .shadow(color: .yellow, radius: 31/3)
            
            
    }
}





#Preview {
    VStack {
        StyledView()
        Spacer()
    }
   /* VStack {
        Animation()
        Spacer()
    }.padding(.top, 200)*/
    
    //GestureView()
}
