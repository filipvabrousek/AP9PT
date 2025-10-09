//
//  Cell.swift
//  Feed-X-02-10-25-sk2
//
//  Created by Filip Vabroušek on 02.10.2025.
//

import SwiftUI

struct ExtractedView: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("Tom's Guide").bold()
                
                Spacer()
                
                Menu {
                    Button("Share"){
                        
                    }
                    
                    Button("Like"){
                        
                    }
                    
                    Button("Comment"){
                        
                    }
                } label: {
                    Image(systemName: "ellipsis")
                }
            }
            
            Text("Warning Don't let hackers trick you into installing this chat app.")
        }
    }
}


struct CellView: View {
    var body: some View {
        VStack(alignment: .leading) {
            
            HStack {
                Image("whale").resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipShape(.circle)
                    .frame(width: 80)
                
               
               ExtractedView()
                
            }
            
            
            
            Image("whale")
                .resizable()
                .aspectRatio(contentMode: .fit)
                
                
                
        
            HStack(spacing: 60) {
                Button {
                    
                } label: {
                    Image(systemName: "sun.min.fill")
                }
                
                Button {
                    
                } label: {
                    Image(systemName: "heart")
                }
                
                
                Button {
                    
                } label: {
                    Image(systemName: "sun.min")
                }
                
                Button {
                    
                } label: {
                    Image(systemName: "sun.min.fill")
                }
                
                Button {
                    
                } label: {
                    Image(systemName: "sun.min.fill")
                }
            }.foregroundStyle(.responsive)
                .font(.system(size: 21))
                .padding()
        }
       
    }
}


struct RootView: View {
    var body: some View {
            VStack {
                TopView()
                ButtonsView()
                
                List {
                    ForEach(0..<100){_ in
                        
                        
                        CellView()
                    }
                }.listStyle(.plain)
                
               
        }
    }
}



#Preview {
    TabView {
        Tab("Home", systemImage: "sun.min.fill") {
            RootView()
        }
        
        Tab("Work", systemImage: "sun.min.fill") {
           Text("Hello")
        }
        
        Tab("Shop", systemImage: "sun.min.fill") {
            Text("Shop")
        }
    }.tabViewBottomAccessory {
        Button("Liquid"){
            
        }
    }
   
}


