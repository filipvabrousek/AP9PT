//
//  Grids_09_10_25_sk2App.swift
//  Grids-09-10-25-sk2
//
//  Created by Filip Vabroušek on 09.10.2025.
//

import SwiftUI

@main
struct Grids_09_10_25_sk2App: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}


struct Grid: View {
    
    var columns = [
        GridItem(.flexible(minimum: 10)),
        GridItem(.flexible(minimum: 10)),
        GridItem(.flexible(minimum: 10))
    ]
    
    
    var body: some View {
        // LazyVStack, LazyHStack also exists
        
        ScrollView {
            LazyVGrid(columns: columns) {
                ForEach(0..<1000){ i in
                    ZStack {
                        
                        
                        Circle()
                            .foregroundStyle(.orange)
                            .frame(width: 80)
                        
                        Text("\(i)")
                            .foregroundStyle(.white)
                            .bold()
                            .font(.system(size: 34))
                    }
                    
                }
            }
        }
    }
}




struct HGrid: View {
    
    var columns = [
        GridItem(.flexible(minimum: 10)),
        GridItem(.flexible(minimum: 10)),
        GridItem(.flexible(minimum: 10))
    ]
    
    let adaptive = [
        GridItem(.adaptive(minimum: 10))
    ]
    
    
    var body: some View {
        // LazyVStack, LazyHStack also exists
        
        ScrollView(.horizontal) {
            LazyHGrid(rows: columns) {
                ForEach(0..<1000){ i in
                    ZStack {
                        
                        
                        Circle()
                            .foregroundStyle(.orange)
                            .frame(width: 80)
                        
                        Text("\(i)")
                            .foregroundStyle(.white)
                            .bold()
                            .font(.system(size: 34))
                    }
                    
                }
            }
        }
    }
}



struct AdaptiveHGrid: View {
    
    var columns = [
        GridItem(.flexible(minimum: 10)),
        GridItem(.flexible(minimum: 10)),
        GridItem(.flexible(minimum: 10))
    ]
    
    let adaptive = [
        GridItem(.adaptive(minimum: 10))
    ]
    
    
    var body: some View {
        // LazyVStack, LazyHStack also exists
        
        ScrollView(.horizontal) {
            LazyHGrid(rows: adaptive, spacing: 10) {
                ForEach(0..<1000){ i in
                    ZStack {
                        
                        
                        Circle()
                            .foregroundStyle(.orange)
                            .frame(width: 30)
                        
                        Text("\(i)")
                            .foregroundStyle(.white)
                            .bold()
                            //.font(.system(size: 34))
                    }
                    
                }
            }
        }
    }
}





struct AdaptiveImagesGrid: View {
    
    var columns = [
        GridItem(.flexible(minimum: 10)),
        GridItem(.flexible(minimum: 10)),
        GridItem(.flexible(minimum: 10))
    ]
    
    let adaptive = [
        GridItem(.adaptive(minimum: 60))
    ]
    
    // every even image iPhone image,
    // every odd image mac studio image
    var body: some View {
        // LazyVStack, LazyHStack also exists
        
        ScrollView(.horizontal) {
            LazyHGrid(rows: adaptive) {
                ForEach(0..<1000){ i in
                    
                    if i % 2 == 0 {
                        Image("iphone")
                            .small()
                        
                    } else {
                        Image("mac-mini")
                            .resizable()
                            .modifier(Mod())
                            //.small()
                        
                        // MyView(url: "mac-mini")
                    }
                }
            }
        }
    }
}


extension Image {
    func small() -> some View {
        self
        .resizable()
        .aspectRatio(contentMode: .fit)
        .frame(width: 90)
    }
}

struct Mod: ViewModifier {
    func body(content: Content) -> some View {
        content
        //.resizable()
        .aspectRatio(contentMode: .fit)
        .frame(width: 90)
    }
}


struct MyView: View {
    var url: String
    
    var body: some View {
        Image(url)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 90)
    }
}
#Preview {
    AdaptiveImagesGrid()
}


