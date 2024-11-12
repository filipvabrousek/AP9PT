//
//  ContentView.swift
//  Navigation-11-11-24
//
//  Created by student on 11.11.2024.
//

import SwiftUI

struct ContentView: View {
    @State var np = NavigationPath()
    
    var body: some View {
        
        NavigationStack(path: $np) {
            List {
             
                // Approach 1 (don't need np)
                NavigationLink("Home", value: "home")
                
                // Approach 2
                /*Button("Go to detail"){
                    np.append("home")
                }*/
            }.navigationDestination(for: String.self) { value in
                if value == "home" {
                   
                    DetailView(np: $np)
                }
            }
        }
    }
}


struct DetailView: View {
    @Binding var np: NavigationPath
    
    var body: some View {
        Button("Go back to root"){
            np.removeLast()
        }
    }
}

#Preview {
    ContentView()
}
