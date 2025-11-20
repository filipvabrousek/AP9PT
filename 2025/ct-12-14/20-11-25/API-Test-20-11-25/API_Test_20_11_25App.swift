//
//  API_Test_20_11_25App.swift
//  API-Test-20-11-25
//
//  Created by Filip Vabroušek on 20.11.2025.
//

import SwiftUI


// https://jsonplaceholder.typicode.com/posts
@main
struct API_Test_20_11_25App: App {
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
    @State var search = ""
    
    var body: some View {
        VStack {
            TextField("Search", text: $search)
                .textInputAutocapitalization(.never)
            
            Button("Search"){
                fetcher.filterPosts(term: search)
            }
            
            List(fetcher.posts){ post in
                Text(post.title)
            }.onAppear {
               // UserDefaults.standard.set("Hello", forKey: "secret")
               let result =  UserDefaults.standard.string(forKey: "secret")
                print(result)
                
                // CoreData
            }
        }.task {
            await fetcher.fetch()
            
        }
    }
}


struct APIImageView: View {
    @EnvironmentObject var fetcher: Fetcher
    
    var body: some View {
        List(fetcher.imagePosts){ post in
            AsyncImage(url: URL(string: post.download_url)){ img in
                img.image?
                    .resizable()
                    .scaledToFit()
                
            }
        }.task {
            await fetcher.fetchImagePosts()
        }
    }
}
