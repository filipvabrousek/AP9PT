//
//  EnumNav.swift
//  Navigation-11-11-24
//
//  Created by student on 11.11.2024.
//

import SwiftUI

enum Destination: Hashable {
    case home
    case profile(String)
    case settings
}

struct EnumNav: View {
    @State var np: [Destination] = []
    
    var body: some View {
        NavigationStack(path: $np){
            VStack {
                Button("Go home"){
                    np.append(.home)
                }
                
                Button("Go to profile view"){
                    np.append(.profile("Filip"))
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








struct EnumNavPre: View {
    var body: some View {
        Text("Enum test")
            .onAppear {
              /*  let dest: String = "hme"
                
                if dest == "home" {
                    print("Show home screen")
                }
                */
                
               /* let dest: Destination = .home
                
                if dest == .home {
                    print("Show homescreen")
                }*/
                
                
            }
    }
}


