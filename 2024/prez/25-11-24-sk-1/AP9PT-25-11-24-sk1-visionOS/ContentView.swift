//
//  ContentView.swift
//  AP9PT-25-11-24-sk1-visionOS
//
//  Created by Filip Vabroušek on 11/25/24.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ContentView: View {
    @State var text = ""
    @State var showAlert = false
    @State var items = [String]()
    
    var body: some View {
        
        
        TextField("Enter an item", text: $text)
            .padding(20)
            .font(.system(size: 30))
        
        //Model3D(url: <#T##URL#>)
        Button("add"){
            if text.isEmpty {
                showAlert.toggle()
               // Alert(title: Text("Error"), message: Text("Please enter an item"), dismissButton: .default(Text("OK")))
            } else {
                items.append(text)
            }
           
        } .font(.system(size: 30))
        .confirmationDialog("Etner items", isPresented: $showAlert) {
            Button("Ok"){
                
            }
        }
        
        List(items, id: \.self){ item in
            Text(item)
                .font(.system(size: 30))
        }
    }
}

#Preview(windowStyle: .automatic) {
    ContentView()
       // .environment(AppModel())
}
