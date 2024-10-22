//
//  ContentView.swift
//  modifierTest
//
//  Created by student on 22.10.2024.
//

import SwiftUI

struct MyMod: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundStyle(.orange)
            .font(.largeTitle)
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
        VStack {
            Text("Hello")
                 .oranged()
            Text("Hello")
                 .oranged()
        }
    }
}

#Preview {
    ContentView()
}
