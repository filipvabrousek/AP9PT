//
//  WebFetcherApp.swift
//  WebFetcher
//
//  Created by Filip Vabroušek on 04.11.2025.
//

import SwiftUI

@main
struct WebFetcherApp: App {
    var body: some Scene {
        WindowGroup {
           // FetchView()
            FetchImagesView()
        }
    }
}


struct FetchView: View {
    @StateObject var viewModel = Fetcher()
    
    var body: some View {
        
        Group {
            if viewModel.isLoading {
                ProgressView("Loading")
            } else {
                
                List(viewModel.posts) { post in
                    VStack(alignment: .leading){
                        Text(post.title)
                            .foregroundStyle(.green)
                            .bold()
                        
                        Text(post.body)
                    }
                }
            }
            
        }.task { // task is for async ops
            await viewModel.fetchPosts()
        }
    }
}





struct FetchImagesView: View {
    @StateObject var viewModel = Fetcher()
    
    var body: some View {
        
        Group {
            if viewModel.isLoading {
                ProgressView("Loading")
            } else {
                
                List(viewModel.images) { post in
                    VStack(alignment: .leading){
                        
                        AsyncImage(url: URL(string: post.download_url)) { image in
                            image.image?.resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 300)
                        }
                           
                        
                      
                        
                       // Text(post.download_url)
                       // Text(post.url)
                        //    .foregroundStyle(.green)
                        //    .bold()
                        
                       // Text(post.body)
                    }
                }
            }
            
        }.task { // task is for async ops
            await viewModel.fetchImages()
        }
    }
}
