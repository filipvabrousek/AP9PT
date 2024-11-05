//
//  SimpleBinding.swift
//  NavigationTest-05-11-24
//
//  Created by student on 05.11.2024.
//

import SwiftUI

struct AView: View {
    @State var name = "Filip"
    
    var body: some View {
        Text("Name \(name)")
        
        BView(name: $name)
    }
}

struct BView: View {
    // @Binding var name: String
    var name: Binding<String>
    var body: some View {
        Button("Change value"){
            name.wrappedValue = "Eda"
        }
    }
}
