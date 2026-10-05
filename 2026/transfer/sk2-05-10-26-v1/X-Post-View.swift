//
//  X-Post-View.swift
//  sk2-05-10-26-v1
//
//  Created by Filip Vabroušek on 05.10.2026.
//

import SwiftUI

struct PostView: View {
    var body: some View {
        HStack {
            
            Image("artemis-II")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 60)
                .clipShape(.circle)
            
            
               
            
            VStack(alignment: .leading) {
                
                Text("Filip liked")
                    .foregroundStyle(.secondary)
          HStack {
            Text("Maximmilian")
                   .bold()
            Text("@maxjacobson")
                .foregroundStyle(.gray)
                
         }
                
                Text("Y'all ready for this post?")
                
                
                HStack {
                    Button {
                        print("Liked")
                    } label: {
                        HStack {
                            Image(systemName: "heart.fill")
                            Text("12")
                        }
                    }
                    
                    Button {
                        print("Liked")
                    } label: {
                        HStack {
                            Image(systemName: "heart.fill")
                            Text("12")
                        }
                    }
                    
                    Button {
                        print("Liked")
                    } label: {
                        HStack {
                            Image(systemName: "heart.fill")
                            Text("12")
                        }
                    }
                }
                
            }
        }
    }
}

#Preview {
    ScrollView {
        PostView()
        PostView()
        PostView()
    }
}
