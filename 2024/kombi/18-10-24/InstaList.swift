//
//  ContentView.swift
//  Testerr
//
//  Created by Filip Vabroušek on 18.10.2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
       Text("Hello")
    }
}

struct AnotherView: View {
    var name: String
    var body: some View {
        HStack { // VStack
            Text("A")
            Text("B")
        }
        
        Text("Hello \(name)")
            .font(.largeTitle)
            .foregroundStyle(.orange)
            .padding()
    }
}



struct CounterView: View {
    @State var count: Int = 0
    
    var body: some View {
        VStack {
            Button("Count is \(count)"){
                count += 1
            }
            
            if count > 0 {
                    Button("Reset"){
                        count = 0
                    }
            }
        }.font(.largeTitle)
        
    }
}
//  AnotherView(name: "Filip")


struct PostView: View {
    var body: some View
    {
        VStack(alignment: .leading) {
            Text("NASA")
            Text("NASA’s Europa Clipper has embarked on its long voyage to Jupiter, where it will investigate Europa, a moon with an enormous subsurface ocean that may have conditions to support life. The spacecraft launched at 12:06 p.m. EDT Monday aboard a SpaceX Falcon Heavy rocket from Launch Pad 39A at NASA’s Kennedy Space Center in Florida. The largest spacecraft NASA ever built for a mission headed to another planet, Europa Clipper also is the first NASA mission dedicated to studying an ocean world beyond Earth. The spacecraft will travel 1.8 billion miles (2.9 billion kilometers) on a trajectory that will leverage the power of gravity assists, first to Mars in four months and then back to Earth for another gravity assist flyby in 2026. After it begins orbiting Jupiter in April 2030, the spacecraft will fly past Europa 49 times.")
        }
        
        Text("Hello, World!")
    }
}

struct InstaCell: View {
    @State var scale = 1.0
    @State var isLiked = false
    
    var body: some View {
        VStack {
            
            HStack {
                Image("foldable")
                    .resizable()
                    .frame(width: 50, height:50)
                    .aspectRatio(contentMode: .fit)
                    .clipShape(.circle)
                
                VStack(alignment: .leading) {
                    Text("Filip")
                    Text("Monterey, CA")
                }
                
                Spacer()
                
            }
            
            
            Image("foldable")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .scaleEffect(scale)
                .onTapGesture {
                    withAnimation {
                scale == 3.0 ? (scale = 1.0) : (scale = 3.0)
                    }
                    
                }
                //.edgesIgnoringSafeArea(.all)
               // .grayscale(0.5)
            
            HStack {
            Button {
                print("Liked")
                isLiked.toggle()
            } label: {
                Image(systemName: isLiked ?"heart.fill" :"heart")
            }.foregroundStyle(isLiked ? Color.red : Color.blue)
                    .symbolEffect(.bounce, value: isLiked)
                
                Button {
                    print("Comment")
                } label: {
                    Image(systemName: "bubble")
                }
                
                
               
                
                
                Button {
                    print("Send")
                } label: {
                    Image(systemName: "paperplane")
                }
                
                
                Spacer()
                
                Button {
                    print("...")
                } label: {
                   Text("...")
                }
                

            }.font(.system(size: 30))
                .bold()
            
            if scale == 1.0 {
                PostView()
            }
            
        }
        
    }
}


struct InstaList: View {
    @State var posts = ["A", "B", "C"]
    var body: some View {
        List(posts, id: \.self){_ in
            InstaCell()
        }.listStyle(.plain)
    }
}

#Preview {
    ContentView()
}
