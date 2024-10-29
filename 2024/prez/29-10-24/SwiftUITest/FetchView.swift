//
//  FetchView.swift
//  SwiftUITest
//
//  Created by student on 29.10.2024.
//

import SwiftUI

struct FetchView: View {
    @StateObject var fetcher = PhotosVM()
    let columns = [
                   GridItem(.flexible()),
                   GridItem(.flexible()),
                   //GridItem(.flexible())
                    ]
                                                                          
    var body: some View {
        VStack {
            
            if fetcher.photo.id != -1 {
                AsyncImage(url: fetcher.photo.url)
                    .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                    .clipShape(.circle)
            }
            
            /*List(fetcher.images, id: \.id) { img in
                Text(img.url!.absoluteString).bold()
            }
            */
            ScrollView {
                LazyVGrid(columns: columns, spacing: 10){
                
                
                ForEach(fetcher.images, id: \.id) { img in
                    AsyncImage(url: img.url){ phase in
                        switch phase {
                        case .success(let image):
                            image.resizable()
                                .aspectRatio(contentMode: .fit)
                                //.frame(height: 300)
                                
                                .border(Color.green, width: 3)
                            
                        case .failure:
                            Image(systemName: "checkmark.fill")
                        case .empty:
                            EmptyView()
                        //@unknown default:
                          //  EmptyView()
                        @unknown default:
                            EmptyView()
                        }
                    }//.bone(into: "aa.txt")
                }
                        
                }
              /*  LazyVGrid(columns: columns, spacing: 10){
                    ForEach(fetcher.images, id: \.id){ image in
                        AsyncImage(url: image.url)
                            .frame(width: 100)
                    }
                }*/
            }
            
            Text("I got \(fetcher.images.count) photos ready. ")
            
            
            
            
        }.font(.largeTitle)
           
        .onAppear {
            fetcher.fetchPhotos()
            
            fetcher.fetchMultiple()
            
            
            
            enum Mood {
                case happy
                case sad
            }
            
            let myMood: Mood = .happy
            
            if myMood == .happy {
                print("I am happy")
            }
        }
    }
}

