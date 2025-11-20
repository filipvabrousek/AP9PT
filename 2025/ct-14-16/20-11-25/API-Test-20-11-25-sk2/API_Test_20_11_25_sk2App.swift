//
//  API_Test_20_11_25_sk2App.swift
//  API-Test-20-11-25-sk2
//
//  Created by Filip Vabroušek on 20.11.2025.
//

import SwiftUI

@main
struct API_Test_20_11_25_sk2App: App {
    let fetcher = Fetcher()
    
    var body: some Scene {
        WindowGroup {
           APIView()
                .environmentObject(fetcher)
        }
    }
}

struct APIView: View {
    @EnvironmentObject var fetcher: Fetcher
    @State var text = ""
    
    var body: some View {
        
        VStack {
            
            HStack {
                
                
                TextField("Search", text: $text)
                    .textInputAutocapitalization(.never)
                
                Button("Search"){
                    fetcher.filter(by: text)
                }
            }
            
            
            
            List {
                
                
                ForEach(fetcher.posts){ post in
                    Text(post.title)
                }
            }.task {
                await fetcher.fetch()
            }
        }
    }
}


struct APIImageView: View {
    @EnvironmentObject var fetcher: Fetcher
    
    var body: some View {
        ScrollView {
            ForEach(fetcher.imagePosts){ post in
                AsyncImage(url: URL(string: post.download_url)){ img in
                    img.image?
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 400)
                    
                }
            }
        }
     .task {
            await fetcher.fetchImages()
        }
    }
}
