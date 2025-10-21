//
//  Animation.swift
//  State-21-10-25-sk2
//
//  Created by Filip Vabroušek on 21.10.2025.
//

import SwiftUI

struct Animation: View {
    @State var rotation = 0.0
    var limit: Double = 60
    
    var body: some View {
        Text("Animate me")
            .font(rotation > limit / 2 ? .system(size: 30, weight: .medium) : .system(size: 40, weight: .black))
            .foregroundStyle(rotation > limit / 2 ? .green : .orange)
            
            .rotationEffect(.degrees(rotation))
            .onTapGesture {
                
    withAnimation(.bouncy(
        duration:0.3,
        extraBounce: 0.69
    )) {
            rotation == limit
                    ? (rotation = 0) : (rotation = limit)
                }
                
            }
    }
}


struct ShapeAnimView: View {
    @State var rotA: Double = 0
    @State var rotB: Double = 0
    @State var rotC: Double = 0
    @State var amount: Double = 0
    
    var body: some View {
        
        ZStack {
            
            
            Rectangle()
                .frame(width: 200, height: 200)
                .foregroundStyle(.blue)
                .rotationEffect(.degrees(rotA))
                .scaleEffect(rotA > 50 ? 1.2 : 1.0)
            
            Rectangle()
                .frame(width: 200, height: 200)
                .foregroundStyle(.green)
                .rotationEffect(.degrees(rotB))
                .scaleEffect(rotA > 50 ? 1.4 : 1.0)
            
            Rectangle()
                .frame(width: 200, height: 200)
                .foregroundStyle(.orange)
                .rotationEffect(.degrees(rotC))
               
                .onTapGesture {
                    withAnimation(.bouncy(
                        duration: 1.0,
                        extraBounce: 0.2
                    )) {
                        rotA == 90 ? (rotA = 0) : (rotA = 90)
                        rotB == 180 ? (rotB = 0) : (rotB = 180)
                        rotC == 270 ? (rotC = 0) : (rotC = 270)
                    }
                }
            
            Slider(value: $amount, in: 0.0...270.0) {
                Text("ROtate")
            }.padding(.top, 320)
                .onChange(of: amount) { oldValue, newValue in
                    
                    withAnimation(.bouncy(
                         duration: 1.0,
                         extraBounce: 0.2
                    )) {
                        if (amount > 1){
                            rotA = amount / 270 * 90
                        } else {
                            rotA = 0
                            rotB = 0
                            rotC = 0
                        }
                        
                    }
                        
                       /* withAnimation(.bouncy(
                            duration: 1.0,
                            extraBounce: 0.2
                        )) {*/
                          /*  rotA == 90 ? (rotA = 0) : (rotA = 90)
                            rotB == 180 ? (rotB = 0) : (rotB = 180)
                            rotC == 270 ? (rotC = 0) : (rotC = 270)*/
                       // }
                    
                    
                    
                    print(newValue)
                }
            
            Text("\(amount)")

            
          
            // rotate squares after tap on this in an animated way
            
        }
            
    }
}

#Preview {
    VStack(alignment: .leading) {
        ShapeAnimView()
            .padding(.top, 40)
        Spacer()
    }
    
}
