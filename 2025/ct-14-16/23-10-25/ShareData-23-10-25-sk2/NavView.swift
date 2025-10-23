//
//  NavView.swift
//  ShareData-23-10-25-sk2
//
//  Created by Filip Vabroušek on 23.10.2025.
//

import SwiftUI

struct NavView: View {
    var body: some View {
        NavigationStack {
            
            VStack {
                
                NavigationLink("First view") {
                    Text("First").toolbar {
                        Button {
                            print("More information")
                        } label: {
                            Label("More information", image: "rosette")
                        }
                    }
                }.font(.largeTitle)
                .toolbar {
                    Button("Next"){
                    }
                }
                
                NavigationLink("Second view") {
                    Text("Second")
                }.font(.largeTitle)
                
                NavigationLink("Third view") {
                    Text("Third")
                }.font(.largeTitle)
                
                Spacer()
            }
        }
    }
}

struct DynamicNavigationView: View {
    @State var np = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $np) {
            VStack(spacing: 24) {
                // Push by value onto the path
                NavigationLink("First view", value: "First")
                NavigationLink("Second view", value: "Second")
                NavigationLink("Third view", value: "Third")
            }
            .font(.largeTitle)
            .navigationDestination(for: String.self) { value in
                VStack(spacing: 24) {
                    Text(value)
                        .foregroundStyle(.green)
                        .navigationTitle(value)
                    
                    Button("Dismiss (pop)") {
                        if !np.isEmpty { np.removeLast() }
                    }
                }
            }
        }
    }
}

#Preview {
    NavView()
        .preferredColorScheme(.dark)
}
