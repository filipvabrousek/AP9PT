//
//  Feed_X_02_10_25_sk1App.swift
//  Feed-X-02-10-25-sk1
//
//  Created by Filip Vabroušek on 02.10.2025.
//

import SwiftUI

@main
struct Feed_X_02_10_25_sk1App: App {
    var body: some Scene {
        WindowGroup {
           Text("Feed")
        }
    }
}

struct HeaderView: View {
    var body: some View {
        VStack(alignment: .leading){
            TopRow()
            TopBarView()
        }
         
    }
}

struct TopRow: View {
    let w = UIScreen.main.bounds.width
    var body: some View {
        
        ZStack(alignment: .leading) {
            
            Image("nasa")
                .resizable()
                .modifier(XModifier(size: 60))
            
            VStack(alignment: .center){
                Image("x-logo")
                    .resizable()
                    .modified(size: 90)
            }.frame(width: w)
            
        }//.frame(width: 300)
        
        
    }
}

struct TopBarView: View {
    var body: some View {
        ScrollView(.horizontal){
            HStack(spacing: 30) {
                Button("Following"){
                    
                }.topbtn()
                
                Button("ZDNet Staff"){
                    
                }.topbtn()
                
                Button("Internet Press Guild"){
                    
                }.topbtn()
                    
            }.padding([.top, .bottom], 10)
        }
    }
}


extension View {
    func topbtn() -> some View {
        self
            .bold()
            .foregroundStyle(.resp)
    }
}

// DRY = modifiers or view extensions
struct XModifier: ViewModifier {
    let size: CGFloat
    
    init(size: CGFloat){
        self.size = size
    }
    
    func body(content: Content) -> some View {
        content
            .aspectRatio(contentMode: .fit)
            .frame(width: size)
            .clipShape(.circle)
    }
}

extension Image {
    func modified(size: CGFloat) -> some View {
        self.resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: size)
            .clipShape(.circle)
    }
}






