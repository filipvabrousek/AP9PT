//
//  PostObservable.swift
//  API-Test-20-11-25
//
//  Created by Filip Vabroušek on 20.11.2025.
//

import Combine
import Foundation

class Post: Codable, Identifiable {
    let id: Int
    let title: String
    let body: String
}

class ImagePost: Codable, Identifiable {
    let id: String // "Expected to decode Int but found a string instead."
    let author: String
    let width: Int
    let height: Int
    let url: String
    let download_url: String
}

class Fetcher: ObservableObject {
    let url = "https://jsonplaceholder.typicode.com/posts"
    let image_url = "https://picsum.photos/v2/list?page=1&limit=20"
    
    @Published var posts: [Post] = []
    @Published var backup: [Post] = []
    
    @Published var imagePosts: [ImagePost] = []
    
    func filterPosts(term: String) {
        if term.isEmpty {
            posts = backup
            return
        }
        
        posts = backup
        
         posts = posts.filter {
             $0.title.lowercased().contains(term.lowercased())
         }
    }
    
    func fetch() async {
        guard let url = URL(string: self.url) else { return }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decoded = try JSONDecoder().decode([Post].self, from: data)
            posts = decoded
            backup = decoded
        } catch {
            print("Error fetching data \(error)")
            return
        }
    }
    
    func fetchImagePosts() async {
        guard let url = URL(string: self.image_url) else { return }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decoded = try JSONDecoder().decode([ImagePost].self, from: data)
            imagePosts = decoded
        } catch {
            print("Error fetching data \(error)")
            return
        }
    }
    
}
