//
//  SimpleNavigation.swift
//  AP9PT-watchOS-25-11-24-sk1 Watch App
//
//  Created by student on 25.11.2024.
//

import SwiftUI

struct NavView: View {
    // State to track the selected item (either "A" or "B")
    @State private var selectedItem: String? = nil
    
    var body: some View {
        NavigationStack {
            VStack {
                NavigationLink("Go to Detail View A", value: "A")
                
                NavigationLink("Go to Detail View B", value: "B")
                
            }
            // Use navigationDestination to navigate to the appropriate detail view
            .navigationDestination(for: String.self) { item in
                // Conditionally navigate to either DetailViewA or DetailViewB
                if item == "A" {
                    DetailViewA()
                } else if item == "B" {
                    DetailViewB()
                } else {
                    Text("Invalid selection")
                }
            }
            .navigationTitle("Main View")
        }
    }
}

struct DetailViewA: View {
    var body: some View {
        VStack {
            Text("This is Detail View A")
                .font(.title)
                .padding()
            
            Spacer()
        }
        .navigationTitle("Detail View A")
    }
}

struct DetailViewB: View {
    var body: some View {
        VStack {
            Text("This is Detail View B")
                .font(.title)
                .padding()
            
            Spacer()
        }
        .navigationTitle("Detail View B")
    }
}


