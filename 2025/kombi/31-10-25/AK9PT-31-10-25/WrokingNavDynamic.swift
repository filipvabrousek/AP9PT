//
//  WrokingNavDynamic.swift
//  AK9PT-31-10-25
//
//  Created by Filip Vabroušek on 31/10/25.
//

import SwiftUI
struct DynamicStringNavigationExample: View {
    @State private var path: [String] = [] // path stores Strings
    
    let items = ["First", "Second", "Third"]
    
    var body: some View {
        NavigationStack(path: $path) {
            List(items, id: \.self) { item in
                Button(item) {
                    // Push dynamically
                    path.append(item)
                }
            }
            .navigationTitle("Items")
            // Define destination for String
            .navigationDestination(for: String.self) { item in
                DetailView(item: item)
            }
        }
    }
}

struct DetailView: View {
    let item: String
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Detail for \(item)")
                .font(.title)
            
            NavigationLink("Go deeper") {
                Text("Nested navigation for \(item)")
            }
        }
        .navigationTitle(item)
    }
}

#Preview {
    DynamicStringNavigationExample()
}





