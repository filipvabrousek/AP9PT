//
//  ContentView.swift
//  viewMod
//
//  Created by student on 21.10.2024.
//

import SwiftUI


struct TitleMod: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundStyle(.orange)
            .font(.system(size: 30))
    }
}

extension View {
    func myTitle() -> some View {
        return self.modifier(TitleMod())
    }
}

struct ContentView: View {
    var body: some View {
       Text("Hello")
            .myTitle()
           // .modifier(TitleMod())
    }
}



#Preview {
    ContentView()
}
