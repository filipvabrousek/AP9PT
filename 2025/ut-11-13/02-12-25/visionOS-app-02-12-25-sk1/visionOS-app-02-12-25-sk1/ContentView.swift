//
//  ContentView.swift
//  visionOS-app-02-12-25-sk1
//
//  Created by Filip Vabroušek on 02.12.2025.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ContentView: View {
    var body: some View {
        VStack {
            Model3D(named: "Scene", bundle: realityKitContentBundle)
                .padding(.bottom, 50)

            Text("Hello, world!")
        }
        .padding()
    }
}


struct RealityTest: View {
    @State var color: String = ""
    
    // Make own shape
    // genereateText
    func getSphere(color: Color) -> ModelEntity {
        let sphere = MeshResource.generateSphere(radius: 0.05)
        let material = SimpleMaterial(color: UIColor(color), isMetallic: false)
        let entity = ModelEntity(mesh: sphere, materials: [material])
        return entity
    }
    
    
    func addText(color: Color) -> ModelEntity {
        let text = MeshResource.generateText("Hello visionOS", extrusionDepth: 0.1, font: .boldSystemFont(ofSize: 0.2))
        let material = SimpleMaterial(color: UIColor(color), isMetallic: true)
        let entity = ModelEntity(mesh: text, materials: [material])
        return entity
    }
    
    
    var body: some View {
        
     
        RealityView { content in
            let entity = getSphere(color: .blue)
            content.add(entity)
            
            let text = addText(color: .orange)
            content.add(text)
        } update: { content in
            // React on state
            if color == "green" {
                let entity = getSphere(color: .green)
                content.add(entity)
            }
        }.onAppear {
            // API fetch
            Timer.scheduledTimer(withTimeInterval: 3.0, repeats: false) { timer in
                color = "green"
            }
        }
    }
}

#Preview(windowStyle: .automatic) {
    ContentView()
}
