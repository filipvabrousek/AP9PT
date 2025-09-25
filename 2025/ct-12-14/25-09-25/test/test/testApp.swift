//
//  testApp.swift
//  test
//
//  Created by Filip Vabroušek on 25.09.2025.
//

import SwiftUI

@main
struct testApp: App {
    var body: some Scene {
        WindowGroup {
            OwnView()
        }
    }
}


struct OwnView: View {
    var body: some View {
        VStack(alignment: .leading) {
            ChildView(name: "Eda")
            ChildView(name: "Karel")
            ChildView(name: "Ota")
            Extracted()
        }
    }
}

struct ImageView: View {
    var body: some View {
        VStack(alignment:.leading, spacing: 0) {
            
            /*Text("Our Sun")
                .font(.system(size: 80))
                .fontWeight(.heavy)
                .foregroundStyle(.orange)*/
            ZStack {
                Image("sun")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .grayscale(0.7)
                    .clipShape(RoundedRectangle(cornerRadius: 21))
                
             /*   Button("Liquid glass"){
                }.buttonStyle(.glass)
                    .font(.largeTitle)*/
            }
        }.padding()
    }
}


struct Extracted: View {
    var body: some View {
        ZStack(alignment: .trailing) { // VStack, HStack, ZStack
            Text("Hello")
                .foregroundStyle(.orange)
                .font(.largeTitle)
                .padding(.horizontal, 20)
                .padding(80)
                .border(.orange)
            
            Text("Next to")
        }
    }
}


struct ChildView: View {
    var name: String
    var body: some View {
        Text("I am child view name is \(name)")
    }
}


struct MultipleItems: View {
    var body: some View {
        List {
            CellView()
            CellView()
            CellView()
            CellView()
            
        }.listStyle(.plain)
    }
}


struct CellView: View {
    var body: some View {
        VStack(alignment: .leading) {
            // To-Do: Feed
            // Title
            // Descritption
            // HStack for buttons
            HStack {
                Image("nasalogo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 30, height: 30)
                Text("NASA")
                    .font(.title)
            }
           
            
            ImageView()
            
            Text("Launching September 24, 2025, from NASA’s Kennedy Space Center in Florida, the missions include NASA’s IMAP (Interstellar Mapping and Acceleration Probe), NASA’s Carruthers Geocorona Observatory, and NOAA’s SWFO-L1 (Space Weather Follow On-Lagrange 1) spacecraft.")
                .padding(.bottom, 12)
            
            HStack {
                Button {
                    
                } label: {
                    Image(systemName: "heart.fill")
                }
                
                Button {
                    
                } label: {
                    Image(systemName: "paperplane.fill")
                }
                
                Button {
                    
                } label: {
                    Image(systemName: "heart.fill")
                }
                
                Spacer()
                
                Button {
                    
                } label: {
                    Image(systemName: "heart.fill")
                }
            }.font(.system(size: 27))
            
        }
    }
}

#Preview {
    MultipleItems()
}
