//
//  Feed_revise_30_09_25_sk2App.swift
//  Feed-revise-30-09-25-sk2
//
//  Created by Filip Vabroušek on 30.09.2025.
//

import SwiftUI

@main
struct Feed_revise_30_09_25_sk2App: App {
    var body: some Scene {
        WindowGroup {
          CellView()
        }
    }
}

struct CellView: View {
    var body: some View {
        VStack(alignment: .leading) {
            // Image + Text, Circle image
            // .clipShape(.circle)
            
            HStack {
                Image("dolphin")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .aspectRatio(contentMode: .fit)
                    .clipShape(.circle)
                    
                Text("Dolphin")
                    .bold()
            }.padding(.leading, 3)
                .padding(.bottom, 3)
            
            
            Image("dolphin")
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            Text("A dolphin is a common name used for some of the aquatic mammals in the cetacean clade Odontoceti, the toothed whales. Dolphins belong to the families Delphinidae (the oceanic dolphins), along with the river dolphin families Platanistidae (the Indian river dolphins), Iniidae (the New World river dolphins), Pontoporiidae (the brackish dolphins), and probably extinct Lipotidae (baiji or Chinese river dolphin). There are 40 extant species named as dolphins.")
                .padding()
            
            HStack {
                
                
                Button {
                    
                } label: {
                    Image(systemName: "heart")
                }
                
                Button {
                    
                } label: {
                    Image(systemName: "bubble")
                }
                
                Button {
                    
                } label: {
                    Image(systemName: "paperplane")
                }
                
                Spacer()
                
                Button {
                    
                } label: {
                    Image(systemName: "bookmark")
                }
                
                
            }.foregroundStyle(.responsive)
                .font(.system(size: 31))
                .padding([.leading, .trailing])
                .padding(.bottom, 3)
            
            
        }
        
    }
}


struct ListView: View {
    var body: some View {
        List {
            CellView()
            CellView()
            CellView()
        }.listStyle(.plain)
    }
}


#Preview {
   ListView()
}
