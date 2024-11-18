//
//  ContentView.swift
//  UIKit-in-SwiftUI
//
//  Created by student on 18.11.2024.
//

import SwiftUI

struct MyRepresentable: UIViewRepresentable {
    var name: String
    
    func makeUIView(context: Context) -> some UIView {
        let lbl = UILabel()
        lbl.text = name
        return lbl
    }
    
    // coordinator control state in SwiftUI View
    /*func makeCoordinator() -> () {
        
    }*/
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        print("update")
    }
}

struct ContentView: View {
    var body: some View {
        MyRepresentable(name: "Filip")
    }
}

#Preview {
    ContentView()
}
