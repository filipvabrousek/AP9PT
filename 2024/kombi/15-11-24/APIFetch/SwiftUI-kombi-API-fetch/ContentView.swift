//
//  ContentView.swift
//  SwiftUI-kombi-API-fetch
//
//  Created by Filip Vabroušek on 11/15/24.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var fetcher = Fetcher()
    
    var body: some View {
        
        List(fetcher.users) { user in
            VStack(alignment: .leading){
                Text(user.name)
                    .font(.headline)
                
                Text(user.email)
                    .font(.subheadline)
                    .foregroundStyle(.gray)
            }
        }

        
        
            .onAppear {
                print("Fetching data...")
                fetcher.fetchUsers()
                
            }
    }
}

#Preview {
    ContentView()
}
