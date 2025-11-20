//
//  Observable.swift
//  API-Test-20-11-25-sk2
//
//  Created by Filip Vabroušek on 20.11.2025.
//

import SwiftUI
import Foundation
import Combine

class Post: Codable, Identifiable {
    let id: Int
    let title: String
    let body: String
}

class ImagePost: Codable, Identifiable {
    let id: String
    let url: String
    let download_url: String
    let author: String
}

class Fetcher: ObservableObject {
    var url = "https://jsonplaceholder.typicode.com/posts"
    var image_url = "https://picsum.photos/v2/list?page=1&limit=20"
    @Published var posts = [Post]()
    @Published var imagePosts = [ImagePost]()
    @Published var backup = [Post]()
    // [2, 4, 6].map {$0 * $0}
    func filter(by: String){
        if by.isEmpty {
            posts = backup
            return
        }
        
        posts = backup
        posts = posts.filter {
            $0.title.contains(by)
        }
    }
    
    func fetch() async {
        guard let url = URL(string: self.url) else { return }
        
        do {
            let (data, _) = try await URLSession
                .shared
                .data(from: url)
            let decoded = try JSONDecoder().decode([Post].self, from: data)
            posts = decoded
            backup = decoded
            
        } catch {
            print("Error fetching data: \(error.localizedDescription)")
        }
        
        
    }
    
    
    func fetchImages() async {
        guard let url = URL(string: self.image_url) else { return }
        
        do {
            let (data, _) = try await URLSession
                .shared
                .data(from: url)
            let decoded = try JSONDecoder().decode([ImagePost].self, from: data)
            imagePosts = decoded
            
        } catch {
            print("Error fetching data: \(error.localizedDescription)")
        }
        
        
    }
    
    
    
}
