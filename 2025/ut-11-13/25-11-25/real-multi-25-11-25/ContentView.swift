//
//  ContentView.swift
//  real-multi-25-11-25
//
//  Created by Filip Vabroušek on 25.11.2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}


struct MatchedGeoEffect: View {
    @Namespace var simple
    
    @State var isSwitched = false
    
    var body: some View {
        VStack {
            Button("Switch"){
                withAnimation {
                    withAnimation(Animation.easeInOut(duration: 0.4)) {
                        self.isSwitched.toggle()
                    }
                }
            }
            
            HStack {
                if isSwitched {
                    Text("Hello")
                        .font(.largeTitle)
                        .matchedGeometryEffect(id: "text", in: simple)
                    
                    Circle()
                        .foregroundStyle(.green)
                        .frame(width: 30,
                               height: 30)
                        .matchedGeometryEffect(id: "circle", in: simple)
                    
                } else {
                    Circle()
                        .foregroundStyle(.green)
                        .frame(width: 30,
                               height: 30)
                        .matchedGeometryEffect(id: "circle", in: simple)
                    
                    Text("Hello")
                        .font(.largeTitle)
                        .matchedGeometryEffect(id: "text", in: simple)
                    
                   
                }
            }
        }
    }
}

// OPTION 1 (new app)
// iOS, iPadOS, macOS, visionOS (included)
// watchOS/tvOS => You need to add target manually file => new target

// OPTION 2 (Existing app)
// Pre-existing (eg. for iOS only)
// iPadOS inckuded
// File => New Taget (watchOS, macOS...)

