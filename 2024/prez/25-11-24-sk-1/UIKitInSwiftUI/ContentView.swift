//
//  ContentView.swift
//  UIKitInSwiftUI
//
//  Created by student on 19.11.2024.
//

import SwiftUI


struct MyView: UIViewRepresentable {
    
    var name: String
    
    func makeUIView(context: Context) -> some UIView {
        let l = UILabel()
        l.text = name
        return l
    }
    
   /* func makeCoordinator() -> () {
        
    } */
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        print("Update")
    }
}

struct ContentView: View {
    var body: some View {
        MyView(name: "Eda")
    }
}

#Preview {
    ContentView()
}
