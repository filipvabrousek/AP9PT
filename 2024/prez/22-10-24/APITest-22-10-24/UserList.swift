//
//  UserList.swift
//  APITest-22-10-24
//
//  Created by student on 22.10.2024.
//

import SwiftUI

struct UserList: View {
    @StateObject var fetcher = Fetcher()
    
    var body: some View {
        List(fetcher.users){ user in
            VStack(alignment: .leading){
                Text(user.name)
                    .font(.headline)
                
                Text(user.email)
                    .font(.subheadline)
                    .foregroundStyle(.gray)
                
            }
            
        }.onAppear {
            fetcher.fetchUser()
        }
    }
}
