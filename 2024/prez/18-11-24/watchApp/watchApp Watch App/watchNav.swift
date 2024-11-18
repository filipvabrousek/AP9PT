//
//  watchNav.swift
//  watchApp Watch App
//
//  Created by student on 18.11.2024.
//

import SwiftUI

struct NavView: View {
    @State private var path = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $path) {
            VStack {
                Text("Home Screen")
                    .font(.title)
                    .padding()

                Button("Go to Detail View") {
                    path.append("detail")
                }
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
            }
            .navigationTitle("Home")
            .navigationDestination(for: String.self) { val in
                
                if val == "detail" {
                    
                    
                    DetailView()
                }
                
                
                
            }
        }
    }
}

struct DetailView: View {
    var body: some View {
        VStack {
            Text("Detail View")
                .font(.title)
                .padding()
        }
        .navigationTitle("Detail")
    }
}

struct DetailScreen { }


