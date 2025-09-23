//
//  SimpleTesterApp.swift
//  SimpleTester
//
//  Created by Filip Vabroušek on 23.09.2025.
//

import SwiftUI

@main
struct SimpleTesterApp: App {
    var body: some Scene {
        WindowGroup {
            ComplexView()
        }
    }
}

// CMD + S, CMD + R
struct MyView: View {
    var body: some View {
        Text("Hello")
            .font(.largeTitle)
            .foregroundStyle(.green)
            .bold()
            .padding()
            .border(Color.green)
            
    }
}



struct LayoutView: View {
    var body: some View {
        HStack {
            Text("Hello")
            Text("Next")
        }.font(.largeTitle)
    }
}

struct GreetingView: View {
    var name: String
    
    var body: some View {
        Text("Hello \(name)")
            .font(.largeTitle)
    }
}



struct ImageView: View {
    var body: some View {
        Image("hero")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .grayscale(0.76)
    }
}



struct ComplexView: View {
    var body: some View {
        // .leading, .trailing
        
        VStack(spacing: 30.0) {
            VStack(alignment: .leading) {
                Text("Hello")
                Text("Smaller").font(.caption)
            }.border(.green, width: 3)
            
            Image("hero")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .grayscale(0.76)
        
            HStack {
                Text("Left")
                Text("Right")
            }.border(.orange, width: 3)
                
        BackView()
        BackView()
        BackView()
            
        }.font(.largeTitle)
            .border(Color.purple)
        
        
    }
}



struct BackView: View {
    var body: some View {
        Text("Hello")
            .font(.largeTitle)
            .bold()
            .padding()
            .background(Color.orange)
            .clipShape(RoundedRectangle(cornerRadius: 21))
            .foregroundStyle(.white)
            
    }
}
