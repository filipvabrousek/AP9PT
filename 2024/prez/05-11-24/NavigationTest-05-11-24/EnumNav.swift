//
//  EnumNav.swift
//  NavigationTest-05-11-24
//
//  Created by student on 05.11.2024.
//

import SwiftUI


enum Destination: Hashable {
    case home
    case profile(String)
    case settings
}

struct EnumNav: View {
    @State private var np: [Destination] = []
    
    var body: some View {
        NavigationStack(path: $np){
            VStack {
                Button("Go home"){
                    np.append(.home)
                }
                
                Button("Go to profile with username"){
                    np.append(.profile("John Doe"))
                }
                
                Button("Go to settings"){
                    np.append(.settings)
                }
            }.navigationDestination(for: Destination.self) { dest in
                
                
                switch dest {
                case .home:
                    Text("Welcome to home screen")
                    
                case .profile(let username):
                    Text("Profile for \(username)")
               
                case .settings:
                    Text("Settings screen")
                }
                
            }
        }
    }
}
