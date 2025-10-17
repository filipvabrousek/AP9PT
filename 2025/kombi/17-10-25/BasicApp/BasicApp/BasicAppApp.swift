//
//  BasicAppApp.swift
//  BasicApp
//
//  Created by Filip Vabroušek on 17/10/25.
//

import SwiftUI

@main
struct BasicAppApp: App {
    var body: some Scene {
        WindowGroup {
           // Text("Hello")
            MyView(name: "Filip")
        }
    }
}


struct MyView: View {
    var name: String
    
    var body: some View {
        ZStack {
            
            
            Text("Hello \(name)")
                .foregroundStyle(.green)
                .font(.largeTitle)
                .bold()
                .border(.cyan)
            
            
            Text("Other text")
                .bold()
                .background(Color.blue)
        }
    }
}


struct ParentView: View {
    var body: some View {
        Text("Parent")
        ChildView()
    }
}

struct ChildView: View {
    var body: some View {
        VStack {
            Text("Child")
            Text("Hello")
        }.border(.orange, width: 3)
         .font(.largeTitle)
        
        
    }
}


struct BorderView: View {
    var body: some View {
         Text("Hello")
            .font(.largeTitle)
            .padding()
            .border(.cyan, width: 8)
            
    }
}

struct ImageView: View {
    var body: some View {
        Image("whale")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 400)
    }
}


struct ShapeView: View {
    var body: some View {
        Circle()
            .foregroundStyle(.orange)
        
        Rectangle()
            .foregroundStyle(.orange)
            .frame(width: 200, height: 400)
    }
}
// : Shape protocol

#Preview {
    ImageView()
}
