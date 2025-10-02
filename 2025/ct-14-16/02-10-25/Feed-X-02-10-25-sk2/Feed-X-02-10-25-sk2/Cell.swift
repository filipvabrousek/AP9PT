//
//  Cell.swift
//  Feed-X-02-10-25-sk2
//
//  Created by Filip Vabroušek on 02.10.2025.
//

import SwiftUI

struct CellView: View {
    var body: some View {
        VStack(alignment: .leading) {
            
            HStack {
                Image("whale").resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipShape(.circle)
                    .frame(width: 80)
                
               
                VStack(alignment: .leading) {
                    Text("Tom's Guide").bold()
                    Text("Warning Don't let hackers trick you into installing this chat app.")
                }
                
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

#Preview {
    VStack {
        
        
        TopView()
    ButtonsView()
        CellView()
        Spacer()
    }
    
}


