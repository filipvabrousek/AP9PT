//
//  InstallCell.swift
//  first-app-06-10-26-sk-2
//
//  Created by Filip Vabroušek on 06.10.2026.
//

import SwiftUI

struct InstallCell: View {
    var body: some View {
        VStack {
            
            TopRow()
                .padding([.leading, .trailing])
            
            Image(.sls2026)
                .resizable()
                .aspectRatio(contentMode: .fit)
              
            
            BottomRow()
            
           }
        }
}



struct BottomRow: View {
    var body: some View {
        HStack {
            Button {
                print("Hi")
            } label: {
                Image(systemName: "heart")
            }
            
            Button {
                print("Hi")
            } label: {
                Image(systemName: "bubble.left")
            }
            
            Button {
                print("Hi")
            } label: {
                Image(systemName: "paperplane")
            }
            
            Spacer()
            
            Button {
                print("Hi")
            } label: {
                Image(systemName: "bookmark")
            }
        }.font(.system(size: 30))
            .foregroundStyle(.black)
    }
}




struct TopRow: View {
    var body: some View {
        
        HStack {
            
            
            Image(.sls2026)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 30)
                .clipShape(.circle)
        
            VStack(alignment: .leading) {
                Text("NASA").bold()
                Text("The freakin'Moon")
            }
            
           /* Button("..."){
                print("Hi")
            }*/
            
            Spacer()
            
            Button {
                print("Hi")
            } label: {
                Image(systemName: "ellipsis")
            }
            
        }
    }
}
#Preview {
    ScrollView {
        InstallCell()
        InstallCell()
        InstallCell()
    }
}
