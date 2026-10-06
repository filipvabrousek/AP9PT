//
//  InstaCell.swift
//  05-10-26-sk1-FirstApp
//
//  Created by Filip Vabroušek on 05.10.2026.
//

import SwiftUI

struct InstaCell: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image("nasa")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                .frame(width: 60)
                //.border(Color.green, width: 4)
                
                VStack(alignment: .leading) {
                    
                    
                    Text("NASA")
                        .bold()
                    Text("Kennedy Space Center")
                }//.border(Color.cyan, width: 3)
                
                Spacer()
                /*
                Button("..."){
                    print("Show menu")
                }*/
                
                Button {
                    print("Show menu")
                } label: {
                    Image(systemName: "ellipsis")
                }
            }.padding(.leading).padding(.trailing).padding(.top)
                //.border(Color.orange, width: 3)
            
            
            Image("orion")
            .resizable()
            
            .aspectRatio(contentMode: .fill)
            
           
            
            HStack {
                Button {
                    
                } label: {
                    Image(systemName: "heart.fill")
                }.font(.largeTitle)
                
                Button {
                    
                } label: {
                    Image(systemName: "heart.fill")
                }.font(.largeTitle)
                
                Button {
                    
                } label: {
                    Image(systemName: "heart.fill")
                }.font(.largeTitle)
                
                Spacer()
                Button {
                    
                } label: {
                    Image(systemName: "heart")
                }.font(.largeTitle)
            }
            
        }
    }
}

#Preview {
    ScrollView {
        InstaCell()
        InstaCell()
        InstaCell()
    }
}
