//
//  ContentView.swift
//  Modifiers-21-01-24
//
//  Created by student on 21.10.2024.
//

import SwiftUI

struct MyMod: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundStyle(.orange)
            .font(.system(size: 50))
            .bold()
    }
}

extension View {
    func oranged() -> some View {
        self.modifier(MyMod())
    }
}

struct ContentView: View {
    var body: some View {
        Text("Hello")
            .oranged()
            
    }
}

#Preview {
    ContentView()
}
