//
//  ContentView.swift
//  NavigationTest
//
//  Created by student on 04.11.2024.
//

import SwiftUI


struct NavViewSimple: View {
    var body: some View {
        NavigationStack {
            List {
                NavigationLink("Detail", value: "Detail")
            }.navigationDestination(for: String.self) { value in
                if value == "Detail" {
                    Text("Detail")
                }
            }
        }
    }
}



// enum

struct NavView: View {
    
    @State var np = NavigationPath()
    
    var body: some View { // iOS 13-iOS 15 NavigationView
        NavigationStack(path: $np) {
            List {
                Button("Go to first screen"){
                    np.append("Detail")
                }
                // NavigationLink("Detail", value: "Detail")
            }.navigationDestination(for: String.self) { value in
                if value == "Detail" {
                    DetailView(navigationPath: $np)
                }
            }
        }
    }
}

struct DetailView: View {
    @Binding var navigationPath: NavigationPath
    
    var body: some View {
        Button("Go back to root"){
            navigationPath.removeLast()
        }
    }
}



// Binding


struct AView: View {
    @State var counter = 0
    var body: some View {
        VStack {
            Button("Count"){
                counter += 1
            }
            BView(counter: $counter)
        }.font(.largeTitle)
    }
}

struct BView: View {
    // @Binding var counter: Int
    var counter: Binding<Int>
    var body: some View {
        Text("Count is \(counter.wrappedValue)")
    }
}







enum Destination: Hashable {
    case home
    case profile(String)
    case settings
}

struct EnumNav: View {
    @State private var navigationPath: [Destination] = []
    
    var body: some View {
        NavigationStack(path: $navigationPath) {
            VStack {
                Button("Go to home"){
                    navigationPath.append(.home)
                }
                
                Button("Go to profile with username"){
                    navigationPath.append(.profile("John Doe"))
                }
                
                Button("Go to settings"){
                    navigationPath.append(.settings)
                }
            }.navigationDestination(for: Destination.self) { dest in
                switch dest {
                case .home:
                    Text("Welcome to the Home screen")
                    
                case .profile(let username):
                    Text("Profile for \(username)")
                    
                case .settings:
                    Text("Settings screen")
                }
            }
        }
    }
}















#Preview {
    NavView()
}
