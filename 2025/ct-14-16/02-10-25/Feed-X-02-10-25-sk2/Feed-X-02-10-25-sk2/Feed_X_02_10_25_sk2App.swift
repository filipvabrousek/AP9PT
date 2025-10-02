//
//  Feed_X_02_10_25_sk2App.swift
//  Feed-X-02-10-25-sk2
//
//  Created by Filip Vabroušek on 02.10.2025.
//

import SwiftUI

@main
struct Feed_X_02_10_25_sk2App: App {
    var body: some Scene {
        WindowGroup {
          TopView()
        }
    }
}


struct TopView: View {
    let w = UIScreen.main.bounds.width
    var body: some View {
        ZStack(alignment: .leading) {
            
            VStack(alignment: .center) {
                Image("x-logo")
                    .resizable()
                    .image()
            }.frame(width: w)
            
            Image("nasa-logo")
                .resizable()
                .modifier(ImageMod())
           
        }
    }
}


struct ButtonsView: View {
    var body: some View {
        
        ScrollView(.horizontal){
            
        
            HStack {
                Button("Following") {
                    
                }.topButton()
                
                Button("ZDNet Staff") {
                    
                }.topButton()
                
                Button("Internet Press Guild") {
                    
                }.topButton()
                
                Button("Following") {
                    
                }.topButton()
                
            }
        }.padding()
    }
}




extension Button {
    func topButton() -> some View {
        self.bold()
            .foregroundStyle(.responsive)
    }
}


struct ImageMod: ViewModifier {
    func body(content: Content) -> some View {
        content
            .aspectRatio(contentMode: .fit)
            .frame(width: 80)
    }
}

extension Image {
    func image() -> some View {
        self
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 80)
    }
}



#Preview {
    VStack {
        
        
        TopView()
    ButtonsView()
    }
}


