//
//  ContentView.swift
//  Geometry
//
//  Created by Student on 27.10.2021.
//

import SwiftUI

struct MyCanvas: View {
    var body: some View {
        if #available(iOS 15.0, *) {
            Canvas { context, size in
                let rect = CGRect(x: 20, y: 20, width: 30, height: 30)
                context.fill(Ellipse().path(in: rect),
                             with: .foreground)
                
            }
        } else {
            Text("Canvas is supported on iOS 15 or newer.")
            // Fallback on earlier versions
        }
    }
}





struct GridView: View {
    var items = (0...99).map {"Item \($0)"}
    
    let columns = [
        // GridItem(.adaptive(minimum: 20))
        GridItem(.flexible(minimum: 80)),
        GridItem(.flexible(minimum: 80))
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns) {
                ForEach(items, id:\.self){ i in
                    Circle()
                        .fill(Color.blue)
                        .frame(height: 80)
                }
            }
        }
    }
}




struct SimpleMatchedEffect: View {
    @Namespace var simple
    @State var isSwitched = false
    
    var body: some View {
        
        VStack {
            
            Button("Switch"){
                withAnimation(Animation.easeOut(duration: 0.4)){
                    self.isSwitched.toggle()
                }
            }
            
            
            HStack {
                
                if (isSwitched){
                    Text("Hello")
                        .font(.largeTitle)
                        .matchedGeometryEffect(id: "text", in: simple)
                    
                    Circle()
                        .foregroundColor(.green)
                        .frame(width: 30, height: 30)
                        .matchedGeometryEffect(id: "circle", in: simple)
                } else {
                    
                    Circle()
                        .foregroundColor(.orange)
                        .frame(width: 30, height: 30)
                        .matchedGeometryEffect(id: "circle", in: simple)
                    
                    Text("Hello")
                        .font(.largeTitle)
                        .matchedGeometryEffect(id: "text", in: simple)
                    
                }
            }
            
            
            
            
            
            
            
            
            
        }
        
        
        
        
        
        
        
        
    }
}

struct Squish: GeometryEffect {
    var value: CGFloat
    
    func effectValue(size: CGSize) -> ProjectionTransform {
        ProjectionTransform(CGAffineTransform(scaleX: value,
                                              y: 1.0))
    }
}



struct ContentView: View {
    @State var size: CGSize = .zero
    
    var body: some View {
        
        Text("Monterey")
            .modifier(Squish(value: 0.5))
        
    }
}




struct SquishContentView: View {
    @State var size: CGSize = .zero
    
    var body: some View {
        
        Text("Moneterey")
            .modifier(Squish(value: 0.5))
        
    }
}




// GeometryEffect


struct OlderImageContentView: View {
    @State var size: CGSize = .zero
    
    var body: some View {
        
        ZStack {
            Image("monterey")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .background(GeometryReader { g in
                    Color.clear.onAppear {
                        self.size = g.size
                    }
                })
            
            
            Text("\(size.width)")
        }
        
    }
}

// MatchedGeometryEffect








struct OldContentView: View {
    var body: some View {
        
        GeometryReader { proxy in
            
            ZStack {
                Rectangle()
                    .foregroundColor(.blue)
                
                Text("\(proxy.size.width)")
            }
            
        }.edgesIgnoringSafeArea(.all)
      
    }
}





struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
