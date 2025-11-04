//
//  WebFetcher_04_11_25_sk2App.swift
//  WebFetcher-04-11-25-sk2
//
//  Created by Filip Vabroušek on 04.11.2025.
//

import SwiftUI

@main
struct WebFetcher_04_11_25_sk2App: App {
    var body: some Scene {
        WindowGroup {
          // FetchImageView()
          //  Revise()
            
            SliderDynamic()
        }
    }
}


struct FetchView: View {
    @StateObject var viewModel = Fetcher()
    
    var body: some View {
        Group {
            if viewModel.isLoading {
                ProgressView()
            } else {
                List(viewModel.posts) { post in
                    Text(post.title)
                }
            }
        }.task {
            await viewModel.fetchPosts()
        }
    }
}





// STEP 3 -------------------------
// DISPLAY POSTS IN UI
struct FetchImageView: View {
    @StateObject var viewModel = Fetcher()
    
    var body: some View {
        Group {
            if viewModel.isLoading {
                ProgressView()
            } else {
                List(viewModel.images) { post in
                    AsyncImage(url: URL(string: post.download_url)) { image in
                        image.image?.resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 300)
                    }
                }
            }
        }.task {
            await viewModel.fetchImagePosts()
        }
    }
}
