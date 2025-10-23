//
//  NavView.swift
//  ShareData-23-10-25-sk1
//
//  Created by Filip Vabroušek on 23.10.2025.
//

import SwiftUI

// NavigationStack



struct NavView: View {
    var body: some View {
        NavigationStack {
            VStack {
                NavigationLink("First View") {
                    Text("First")
                        .toolbar {
                            Button("Approve all"){
                                
                            }
                        }
                } .toolbar {
                    Button("Share"){
                      
                    }
                }
                
                NavigationLink("Second View") {
                    Text("Second")
                        .navigationTitle("Second")
                }
                
                NavigationLink("Third View") {
                    ThirdView()
                        .navigationTitle("Third")
                }
            }
        }
    }
}



struct NavViewDynamic: View {
    @State var np = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $np) {
            VStack {
                
                NavigationLink("First View") {
                    Text("First")
                        .toolbar {
                            Button("Approve all"){
                                
                            }
                        }
                } .toolbar {
                    Button("Share"){
                        np.append("A")
                    }
                }
                
                NavigationLink("Second View") {
                    Text("Second")
                        .navigationTitle("Second")
                }
                
                NavigationLink("Third View") {
                    ThirdView()
                        .navigationTitle("Third")
                }
            }.navigationDestination(for: String.self) { value in
                Text(value)
                
                Button("pop"){
                    np.removeLast()
                }
            }
        }
    }
}

struct ThirdView: View {
    var body: some View {
        Text("Third")
            .font(.largeTitle)
            .bold()
            .foregroundStyle(.green)
    }
}


struct Tabs: View {
    var body: some View {
        TabView {
            Tab("First", systemImage: "house") {
                Text("A")
            }
            
            Tab("First", systemImage: "cat") {
                Text("A")
            }
            
            Tab("First", systemImage: "music.note") {
                Text("A")
            }
           
            
        }
    }
}
#Preview {
   Tabs() //NavView()
}
