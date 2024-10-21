//
//  UserList.swift
//  AP9PT-APIFetch-21-10-24
//
//  Created by student on 21.10.2024.
//

import SwiftUI

struct UserList: View {
    @StateObject var viewModel = UserVM()
    
    var body: some View {
        List(viewModel.users){ user in
            VStack(alignment: .leading){
                Text(user.name)
                    .font(.headline)
                
                Text(user.email)
                    .font(.subheadline)
                    .foregroundStyle(.gray)
            }
        }.onAppear {
            viewModel.fetchUsers()
        }
    }
}
