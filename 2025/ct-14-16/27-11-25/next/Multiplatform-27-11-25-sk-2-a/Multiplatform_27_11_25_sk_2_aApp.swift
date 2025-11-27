//
//  Multiplatform_27_11_25_sk_2_aApp.swift
//  Multiplatform-27-11-25-sk-2-a
//
//  Created by Filip Vabroušek on 27.11.2025.
//

import SwiftUI

@main
struct Multiplatform_27_11_25_sk_2_aApp: App {
    var body: some Scene {
        WindowGroup {
         MatchedView()
        }
    }
}


struct MatchedView: View {
    @Namespace var all
    @State var isSwitched: Bool = false
    
    var body: some View {
        Button("Switch"){
            withAnimation(.easeInOut){
                isSwitched.toggle()
            }
        }
        
        if isSwitched {
            
            
            HStack {
                Text("Text")
                    .font(.largeTitle)
                    .matchedGeometryEffect(id: "text",
                                           in: all)
                
                Circle()
                    .foregroundStyle(.orange)
                    .frame(width: 50, height: 50)
                    .matchedGeometryEffect(id: "circle",
                                           in: all)
                
            }
            
        } else {
            
            
            
            HStack {
                Circle()
                    .foregroundStyle(.orange)
                    .frame(width: 50, height: 50)
                    .matchedGeometryEffect(id: "circle",
                                           in: all)
                Text("Text")
                    .font(.largeTitle)
                    .matchedGeometryEffect(id: "text",
                                           in: all)
                
                
                
            }
        }
    }
}
