//
//  Fetcher.swift
//  WebFetcher-04-11-25-sk2
//
//  Created by Filip Vabroušek on 04.11.2025.
//

import Foundation
import SwiftUI
import Combine

// https://jsonplaceholder.typicode.com/posts
/*
 {
    "userId": 1,
    "id": 1,
    "title": "sunt aut facere repellat provident occaecati excepturi optio reprehenderit",
    "body": "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto"
  },
 */


// STEP 1 -------------------------
// POST STRUCTURE
// IMAGE POST STRUCTURE
struct Post: Codable, Identifiable {
    let id: Int
    let title: String
    let body: String
}

struct ImagePost: Codable, Identifiable {
    let id: String
    let author: String
    let width: Int
    let height: Int
    let url: String
    let download_url: String
}

// STEP 2 -------------------------
// FETCHER CLASS
// IMAGE POST STRUCTURE
class Fetcher: ObservableObject {
    var url = "https://jsonplaceholder.typicode.com/posts"
    @Published var posts: [Post] = []
    
    var imageurl = "https://picsum.photos/v2/list?page=1&limit=20"
    @Published var images: [ImagePost] = []
    
    @Published var isLoading = false

    // STEP 2.1 -------------------------
    // FETCH POSTS
    func fetchPosts() async {
        isLoading = true
        
        guard let url = URL(string: url) else { return }
       
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decoded = try JSONDecoder().decode([Post].self, from: data)
            posts = decoded
            isLoading = false
        } catch {
           // isLoading = false
            print("Error fetching data: \(error)")
            return
        }
    }
    
    
    // STEP 2.1 -------------------------
    // FETCH IMAGE POSTS
    func fetchImagePosts() async {
        isLoading = true
        
        guard let url = URL(string: imageurl) else { return }
       
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decoded = try JSONDecoder().decode([ImagePost].self, from: data)
            images = decoded
            isLoading = false
        } catch {
           // isLoading = false
            print("Error fetching data: \(error)")
            return
        }
    }
    
}


// TASK
// https://picsum.photos/v2/list?page=1&limit=20
// Fetch images
// struct with ALL keys
// AsyncImage(url: url)
// Display in Grid
