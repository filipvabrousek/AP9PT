//
//  FeedApp.swift
//  Feed
//
//  Created by Filip Vabroušek on 25.09.2025.
//

import SwiftUI

@main
struct FeedApp: App {
    var body: some Scene {
        WindowGroup {
           RootView()
        }
    }
}

struct RootView: View {
    var body: some View {
        
        VStack {
            OwnView(name: "Eda")
            
            ZStack(alignment: .leading) {
                Text("Hello")
                    .foregroundStyle(.orange)
                    .fontWeight(.heavy)
                    .padding(.vertical)
                    .border(.green)
                
                Text("Nice") // at the top
            }.font(.largeTitle)
            
        }
    }
}

struct OwnView: View {
    var name: String
    
    var body: some View {
        Text("Some view which has name \(name)")
        .font(.largeTitle)
    }
}


struct ImageView: View {
    var body: some View {
        
        VStack(alignment: .leading,
               spacing: 0) {
            
          /*  Text("Our Sun")
                .font(.system(size: 70))
                .fontWeight(.heavy)
                .foregroundStyle(.orange)*/
                
            Image("sun")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .grayscale(0.7)
                .clipShape(RoundedRectangle(cornerRadius: 30))
                
        }.padding()
    }
}

struct ListView: View {
    var body: some View {
        List {
            
            /*
             title
             row with buttons like share comment
             description
             */
            CellView()
            CellView()
            CellView()
        
        }.listStyle(.plain)
    }
}

struct CellView: View {
    var body: some View {
        VStack(alignment: .leading) {
            
            
            HStack{
                Image("nasa-logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 40)
                Text("NASA")
                    .bold()
                
                Spacer()
                
                Button {
                } label: {
                    Image(systemName: "ellipsis")
                }
                
            }
           
            ImageView()
            
            Text("Launching September 24, 2025, from NASA’s Kennedy Space Center in Florida, the missions include NASA’s IMAP (Interstellar Mapping and Acceleration Probe), NASA’s Carruthers Geocorona Observatory, and NOAA’s SWFO-L1 (Space Weather Follow On-Lagrange 1) spacecraft.")
                .padding(.bottom)
            
            HStack {
                Button {
                    print("Tapped")
                } label: {
                    Image(systemName: "heart")
                }
                
                Button {
                    print("Tapped")
                } label: {
                    Image(systemName: "bubble")
                }
                
                
                Button {
                    print("Tapped")
                } label: {
                    Image(systemName: "paperplane")
                }
                
                Spacer()
                
                Button {
                    print("Tapped")
                } label: {
                    Image(systemName: "bookmark")
                }
            }.font(.largeTitle)
            
            
            
            
        }
    }
}


struct ShapeView: View {
    
    var gradient = RadialGradient(
        colors: [.cyan, .green],
        center: .center,
        startRadius: 50,
        endRadius: 100)
        
        var lin = LinearGradient(colors: [.blue, .green],
                                 startPoint: .leading,
                                 endPoint: .trailing)
    
    
    var body: some View {
        Circle()
            .fill(gradient)
            .shadow(radius: 2)
           
        
        Rectangle()
            .fill(lin)
            .foregroundStyle(.orange)
            .frame(width: 200, height: 200)
    }
}


#Preview {
    ShapeView()
}


