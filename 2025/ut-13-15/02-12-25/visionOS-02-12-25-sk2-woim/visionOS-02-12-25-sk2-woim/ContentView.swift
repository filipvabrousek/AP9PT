//
//  ContentView.swift
//  visionOS-02-12-25-sk2-woim
//
//  Created by Filip Vabroušek on 02.12.2025.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ContentView: View {
    @Environment(\.openWindow) var open
    
    var body: some View {
        VStack {
            Button("Open window"){
                Task {
                     open(id: "mywindow")
                }
            }
            
            List {
                Text("Hello")
            }
          //  Model3D(named: "Scene", bundle: realityKitContentBundle)
                .padding(.bottom, 50)

          //  Text("Hello, world!")
        }
        .padding()
    }
}

#Preview(windowStyle: .automatic) {
    ContentView()
}
