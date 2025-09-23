//
//  SwiftUITestAppApp.swift
//  SwiftUITestApp
//
//  Created by Filip Vabroušek on 23.09.2025.
//

import SwiftUI

@main
struct SwiftUITestAppApp: App {
    var body: some Scene {
        WindowGroup {
            // MyView(name: "Filip")
           // OtherView()
          //  ImageView()
            ComplexView()
        }
    }
}


struct MyView: View {
    var name: String
    var body: some View {
        Text("Hello \(name)")
            .font(.largeTitle)
            .foregroundStyle(.green)
            .bold()
            .padding()
            .border(Color.orange)
            .onAppear {
                print("Appeared")
            }
    }
}



struct OtherView: View {
    var body: some View {
        ZStack { // VStack, HStack
            Text("Hello").opacity(0.3)
            Text("Other")
        }.font(.largeTitle)
    }
}



struct ImageView: View {
    var body: some View {
        Image("hero")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .grayscale(0.7)
           
    }
}


struct ComplexView: View {
    var body: some View {
        
        
        HStack {
            VStack(alignment: .leading) {
                Text("Hello")
                Text("Subtitle").font(.caption)
            }
            
            Button("Text"){
                print("sth")
            }.padding()
            .background(.orange)
            .clipShape(RoundedRectangle(cornerRadius: 30))
            
        }.font(.largeTitle)
    }
}







// CMD + S, CMD + R
