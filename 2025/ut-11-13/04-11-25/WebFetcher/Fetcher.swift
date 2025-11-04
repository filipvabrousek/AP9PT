//
//  Fetcher.swift
//  WebFetcher
//
//  Created by Filip Vabroušek on 04.11.2025.
//

import Foundation
import Combine

// https://jsonplaceholder.typicode.com/posts

/*
 [
   {
     "userId": 1, // IGNORE
     "id": 1,
     "title": "sunt aut facere repellat provident occaecati excepturi optio reprehenderit",
     "body": "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto"
   },
 */

struct Post: Codable, Identifiable {
    let id: Int
    let title: String
    let body: String
}

struct ImagePost: Codable, Identifiable {
    // Matches Picsum schema
    let id: String
    let author: String
    let width: Int
    let height: Int
    let url: String
    let download_url: String
}

/*
 {
     "id": "0",
     "author": "Alejandro Escamilla",
     "width": 5000,
     "height": 3333,
     "url": "https://unsplash.com/photos/yC-Yzbqy7PY",
     "download_url": "https://picsum.photos/id/0/5000/3333"
   },
 */

@MainActor
class Fetcher: ObservableObject {
    var url = "https://jsonplaceholder.typicode.com/posts"
    @Published var posts: [Post] = []
    @Published var images: [ImagePost] = []
    
    var imageURL = "https://picsum.photos/v2/list?page=1&limit=20"
    // add loading
    @Published var isLoading = false
    
    func fetchPosts() async {
        guard let url = URL(string: url) else {
            print("Invalid posts URL")
            return
        }
        isLoading = true
        defer { isLoading = false }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decoded = try JSONDecoder().decode([Post].self, from: data)
            posts = decoded
        } catch {
            print("Something went wrong during the fetch: \(error)")
        }
    }
    
    func fetchImages() async {
        guard let url = URL(string: imageURL) else {
            print("Invalid images URL")
            return
        }
        isLoading = true
        defer { isLoading = false }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decoded = try JSONDecoder().decode([ImagePost].self, from: data)
            images = decoded
        } catch {
            print("Something went wrong during the fetch of images: \(error)")
        }
    }
}

// Fetch photos from https://picsum.photos/v2/list?page=1&limit=20
// Into LazyVGrid
// Load URL into model

// AsyncImage(url: url) SwiftUI
