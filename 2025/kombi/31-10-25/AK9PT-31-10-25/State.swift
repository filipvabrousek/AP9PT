//
//  State.swift
//  AK9PT-31-10-25
//
//  Created by Filip Vabroušek on 31/10/25.
//

import SwiftUI

struct StateView: View {
    @State var counter = 0
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("\(counter)")
            
            Text("\(counter * 2)")
            
            Button("Count up"){
                counter += 1
            }
        }.font(.largeTitle)
    }
}


struct Hider: View {
    @State var show = false
    
    var body: some View {
        VStack {
            Button("Click"){
                show.toggle()
            }
            
            Spacer()
            
            if show {
                Text("Shown")
            }
            
        }.frame(width: 200, height: 200)
         .border(.green)
        .font(.largeTitle)
    }
}



struct EffectView: View {
    let gradient = LinearGradient(
        colors: [.green, .orange, .yellow],
        startPoint: .leading,
        endPoint: .trailing
    )
    
    var gradientStopsStyle = Gradient(stops: [
        Gradient.Stop(color: .blue, location: 0),
        Gradient.Stop(color: .purple, location: 0.25),
        Gradient.Stop(color: .red, location: 0.5),
        Gradient.Stop(color: .orange, location: 0.75),
        Gradient.Stop(color: .yellow, location: 1)
    ])
    
    
    
    
    var body: some View {
       // Circle()
        
        
        ZStack {
            
        
            
            
            GlassEffectContainer {
                
               // Image("whale")
                
                GeometryReader { proxy in
                    Rectangle()
                    
                        .fill(.green)
                        .frame(width: proxy.size.width / 2,
                               height: proxy.size.width / 2)
                    // .fill(rad)
                        .padding()
                        .shadow(radius: 10)
                    //.glassEffect()
                    //.scaleEffect(1.4)
                    //.rotationEffect(.degrees(95))
                    
                }
            }
            
        }
        
        
       
        
       
    }
}

struct AdaptiveRadialGradientCircle: View {
    var gradientStops = Gradient(stops: [
        .init(color: .blue, location: 0.0),
        .init(color: .purple, location: 0.25),
        .init(color: .red, location: 0.5),
        .init(color: .orange, location: 0.75),
        .init(color: .yellow, location: 1.0)
    ])
    
    var body: some View {
        GeometryReader { geometry in
            let radius = min(geometry.size.width, geometry.size.height) / 2
            Circle()
                .fill(
                    RadialGradient(
                        gradient: gradientStops,
                        center: .center,
                        startRadius: 0,
                        endRadius: radius
                    )
                )
                .frame(width: geometry.size.width, height: geometry.size.height)
        }
        .aspectRatio(1, contentMode: .fit)
        .padding()
    }
}




struct LiquidGlass: View {
    var body: some View {
        ZStack {
            Image("whale")
            
            Button("Click me"){
                
            }.padding()
                .glassEffect(.regular.interactive())
            .padding(.bottom, 230)
        }
    }
}



enum Destination: Hashable {
    case home
    case settings
}

struct NavView: View {
    @State var np:[Destination] = []// NavigationPath()
    
    var body: some View {
        NavigationStack(path: $np) {
            NavigationLink(value: Destination.home) {
                Label {
                    Text("Hello")
                } icon: {
                    Image(systemName: "sun.min.fill")
                }
            }
            
            
            Button("Nav"){
                np.append(.home)
            }
            
            NavigationLink(value: Destination.home) {
                Label {
                    Text("Works")
                } icon: {
                    Image(systemName: "sun.min.fill")
                }
            }
            
            NavigationLink(value: Destination.settings) {
                Label {
                    Text("Hello")
                } icon: {
                    Image(systemName: "sun.min.fill")
                }
            }
            
            
            NavigationLink(value: Destination.home) {
                Label {
                    Text("Hello")
                } icon: {
                    Image(systemName: "sun.min.fill")
                }
            }

            // fix
        }.navigationDestination(for: Destination.self) { dest in
            if dest == .home {
                Text("Home")
            }
            
            if dest == .settings {
                Text("School")
            }
            
            //Text()
        }
    }
} //



#Preview {
   // AdaptiveRadialGradientCircle()
   // LiquidGlass()
    NavView()
}
