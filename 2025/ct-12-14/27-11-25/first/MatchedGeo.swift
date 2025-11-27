//
//  MatchedGeo.swift
//  Multiplatform-27-11-25
//
//  Created by Filip Vabroušek on 27.11.2025.
//

import SwiftUI

struct MatchedGeo: View {
    @Namespace var geo
    @State var isSwitched = false
    
    var body: some View {
        Text("MatchedGeo")
        
        VStack {
            Button("Switch"){
                withAnimation(Animation.easeInOut){
                    isSwitched.toggle()
                }
            }
            
            if isSwitched {
                
                
                HStack {
                    Text("Hello")
                        .foregroundStyle(.orange)
                        .font(.largeTitle)
                        .matchedGeometryEffect(id: "text",
                                               in: geo)
                    
                    Circle()
                        .foregroundStyle(.orange)
                        .frame(width: 100, height: 100)
                        .matchedGeometryEffect(id: "circle",
                                               in: geo)
                }
            } else {
                HStack {
                    Circle()
                        .foregroundStyle(.orange)
                        .frame(width: 100, height: 100)
                        .matchedGeometryEffect(id: "circle",
                                               in: geo)
                    
                    Text("Hello")
                        .foregroundStyle(.orange)
                        .font(.largeTitle)
                        .matchedGeometryEffect(id: "text",
                                               in: geo)
                    
                  
                }
            }
            
            
        }
    }
}
