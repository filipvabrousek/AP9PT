//
//  ContentView.swift
//  NavigationTest-05-11-24
//
//  Created by student on 05.11.2024.
//

import SwiftUI

struct NavView: View {
    @State var np = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $np) {
            List {
                Button("Go to detail screen"){
                    np.append("Detail")
                }
                // NavigationLink("Detail", value: "Detail")
            }.navigationDestination(for: String.self) { value in
                if value == "Detail" {
                    DetailView(navigationPath: $np)
                }
            }
        }
    }
}

struct DetailView: View {
    @Binding var navigationPath: NavigationPath
    
    var body: some View {
        Button("Go back to root"){
            navigationPath.removeLast()
        }
    }
}




#Preview {
    NavView()
}
