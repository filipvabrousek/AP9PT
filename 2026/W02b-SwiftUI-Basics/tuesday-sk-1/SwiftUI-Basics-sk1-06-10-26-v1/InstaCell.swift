//
//  InstaCell.swift
//  SwiftUI-Basics-sk1-06-10-26-v1
//
//  Created by Filip Vabroušek on 06.10.2026.
//

import SwiftUI

// Insta Cell + State + Agentic game

struct InstaCell: View {
    var body: some View {
        
        VStack {
            TopView()
                .padding([.leading, .trailing])
                .padding([.top, .bottom], -20)
                .border(.green)
            
            Image("orion")
                .resizable()
                .aspectRatio(contentMode: .fill)
            
            
            ButtonsView()
        }
    }
}

struct ButtonsView: View {
    var body: some View {
        HStack {
            Button {
                print("More")
            } label: {
                Image(systemName: "heart.fill")
            }
            
            Button {
                print("More")
            } label: {
                Image(systemName: "bubble.fill")
            }
            
            Button {
                print("More")
            } label: {
                Image(systemName: "paperplane.fill")
            }
            
            Spacer()
            Button {
                print("More")
            } label: {
                Image(systemName: "bookmark.fill")
            }
            
        }.padding(10)
            .foregroundStyle(.black)
            .font(.system(size: 40))
        
        
    }
}






struct TopView: View {
    var body: some View {
        HStack {
            Image("orion")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 60)
                .clipShape(.circle)
           
            VStack(alignment: .leading) {
                Text("NASA").bold()
                Text("The freakin' Moon")
            }
            
          
            Spacer()
            
            Button {
                print("More")
            } label: {
                Image(systemName: "ellipsis")
            }

        }
    }
}

#Preview {
    ScrollView {
        InstaCell()
    }
}

