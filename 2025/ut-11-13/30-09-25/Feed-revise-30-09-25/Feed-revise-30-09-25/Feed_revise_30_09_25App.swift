//
//  Feed_revise_30_09_25App.swift
//  Feed-revise-30-09-25
//
//  Created by Filip Vabroušek on 30.09.2025.
//

import SwiftUI

@main
struct Feed_revise_30_09_25App: App {
    var body: some Scene {
        WindowGroup {
            CellView()
        }
    }
}

// CMD + A, CTRL + I
struct CellView: View {
   
    var body: some View {
        VStack(alignment: .leading) {
            
            HStack {
                Image("noaa-png")
                    .resizable()
                    .frame(width: 40, height: 40)
                Text("Oceans")
                    .bold()
                    .font(.system(size: 21))
            }.padding()
            
            
            Image("whale")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .grayscale(0.7)
            
            HStack {
                // like btn
                Button {
                    print("Text")
                } label: {
                    Image(systemName: "heart")
                }//.symbolEffect(.pulse, value: pulse)
                
                Button {
                    print("Text")
                } label: {
                    Image(systemName: "key.horizontal")
                }
                
                
                Button {
                    print("Text")
                } label: {
                    Image(systemName: "map.fill")
                }
                
                Spacer()
                
                Button {
                    print("Key")
                } label: {
                    Image(systemName: "bookmark.fill")
                }
                
                
                
            }.font(.largeTitle)
                .foregroundStyle(.black)
                .padding(.bottom, 3)
                .padding(.top, 3)
            
            
            
            Text("Whales are a widely distributed and diverse group of fully aquatic placental marine mammals. As an informal and colloquial grouping, they correspond to large members of the infraorder Cetacea, i.e. all cetaceans apart from dolphins and porpoises. Dolphins and porpoises may be considered whales from a formal, cladistic perspective. Whales, dolphins and porpoises belong to the order Cetartiodactyla, which consists of even-toed ungulates. Balaenopteridae (the rorquals), Balaenidae (right whales), Cetotheriidae (the pygmy right whale), and Eschrichtiidae (th")
                .padding(.leading)
            
                
                
        }
        
    }
}


// Effects revise
struct EffectsView: View {
    let grad: Gradient = Gradient(colors: [.red, .blue, .yellow])
    
    let rad = RadialGradient(
        colors: [.green, .orange, .yellow],
        center: .center,
        startRadius: 10,
        endRadius: 140
    )
    
    var body: some View {
       // Circle()
        //Rectangle()
        CellView()
            .frame(width: 300, height: 300)
            .foregroundStyle(rad)
            .padding()
            .shadow(color: .orange, radius: 29, x: 10, y: 21)
            .border(.green, width: 10)
            .rotationEffect(.degrees(45))
           
            
            
    }
}



struct ListView: View {
    var body: some View {
        List {
            EffectsView()
            EffectsView()
            EffectsView()
        }.listStyle(.plain)
            //.listSectionSeparator(.hidden)
    }
}


struct ListArray: View {
    var items = ["Karel", "Jana", "Eda", "Hana"]
    
    var body: some View {
        List(items, id:\.self){
            Text($0)
        }
    }
}

// Below button => Show appearance

#Preview {
    ListArray()
}
