//
//  ShareData.swift
//  NavigationTest-05-11-24
//
//  Created by student on 05.11.2024.
//

import SwiftUI

class Passer: ObservableObject {
    @Published var name: String = ""
}

struct RootView: View {
    let passer = Passer()
    
    var body: some View {
        VStack {
            AVView().environmentObject(passer)
            BVView().environmentObject(passer)
        }
    }
    
}


struct AVView: View {
    @EnvironmentObject var passer: Passer
    var body: some View {
        Button("Change data"){
            passer.name = "Karel"
        }
    }
}

struct BVView: View {
    @EnvironmentObject var passer: Passer
    var body: some View {
        Text("Hello \(passer.name)")
    }
}

