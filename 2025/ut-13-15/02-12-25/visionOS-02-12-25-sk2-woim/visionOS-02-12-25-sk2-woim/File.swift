//
//  File.swift
//  visionOS-02-12-25-sk2-woim
//
//  Created by Filip Vabroušek on 02.12.2025.
//


import RealityKit
import SwiftUI


struct ProgrammaticReality: View {
    @State var color = ""
    
    // AddCone
    // MeshResource.
    // MeshResource.generateText...
    
    func addSphere(color: Color) -> ModelEntity {
        let sphere = MeshResource.generateSphere(radius: 0.05)
        let material = SimpleMaterial(color: UIColor(color), isMetallic: false)
        let model = ModelEntity(mesh: sphere,
                                materials: [material])
        return model
    }
    
    func addText() -> ModelEntity {
        let text = MeshResource.generateText("Hello visionOS", extrusionDepth: 0.1, font: .boldSystemFont(ofSize: 0.2))
        let material = SimpleMaterial(color: .blue, isMetallic: true)
        let model = ModelEntity(mesh: text,
                                materials: [material])
        return model
        
        
    }
    
    
    
    var body: some View {
        RealityView { content in
            let sphere = addSphere(color: .blue)
            content.add(sphere)
            
            
            let text = addText()
            content.add(text)
        } update: { content in
            if color == "green" {
                let sphere = addSphere(color: .green)
                content.add(sphere)
            }
        }.onAppear {
            Timer.scheduledTimer(withTimeInterval: 3.0, repeats: true) { timer in
                color = "green"
            }
        }
    }
}
