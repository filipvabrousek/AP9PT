//
//  CellView.swift
//  Feed-X-02-10-25-sk1
//
//  Created by Filip Vabroušek on 02.10.2025.
//

import SwiftUI

struct CellView: View {
    var body: some View {
        
        VStack(alignment: .leading){
            
            HStack {
                Image("nasa")
                    .modified(size: 70)
                
                VStack(alignment: .leading) {
                    
                    
                    HStack {
                        
                        
                        Text("Tom's guide").bold()
                        
                        VStack {
                            
                        
                        Text("@tomsguide")
                            .foregroundStyle(.gray)
                            .font(.caption)
                        
                        Text("09/10/2025")
                            .font(.caption)
                            
                            
                    }
                        
                        Menu {
                            Button("Share"){
                                
                            }
                            
                            Button("Retweet"){
                                
                            }
                            
                            Button("Delete"){
                                
                            }
                        } label: {
                            Label {
                                Text("")
                            } icon: {
                                Image(systemName: "ellipsis")
                            }.labelsHidden()

                        }
                        
                        
                    }
                    
                    
                    
                    Text("Warning Don't let hackers trick you into installing this chat app")
                        .font(.system(size: 19))
                } .padding()
            } // HSTACK END
                
            
          
            
            Image("whale")
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            HStack(spacing: 60) {
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
                    Image(systemName: "square.and.arrow.up")
                }
                
                Button {
                    
                } label: {
                    Image(systemName: "arrow.uturn.forward")
                }
                
                Button {
                    
                } label: {
                    Image(systemName: "sun.min")
                }
            }.padding()
            
        }
        
        
    }
}

#Preview {
    VStack(alignment: .leading){
      //  HeaderView()
        CellView()
       // Spacer()
    }
}


