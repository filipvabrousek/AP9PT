//
//  File.swift
//  visionOS-app-04-12-25-sk1
//
//  Created by Filip Vabroušek on 04.12.2025.
//

import SwiftUI
import RealityKit

/*
 in :App file
 WindowGroup(id: "mywindow"){
     Text("My window")
 }
 */
struct ProgrammaticReality: View {
    @State var color = ""
    
    @Environment(\.openWindow) var open
    
    func addSphere(color: Color) -> ModelEntity {
        let sphere = MeshResource.generateSphere(radius: 0.05)
        let material = SimpleMaterial(color: UIColor(color), isMetallic: false)
        let model = ModelEntity(mesh: sphere, materials: [material])
        return model
    }
    
    var body: some View {
        
        Button("Open"){
            Task {
                 open(id: "mywindow")
            }
        }
        
        
        RealityView { content in
            let model = addSphere(color: .blue)
            content.add(model)
            
        } update: { content in
            if color == "green"{
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
