//
//  Service.swift
//  SwiftUITest
//
//  Created by student on 29.10.2024.
//

import SwiftUI

struct Photo: Identifiable, Codable {
    let id: Int
    let url: URL?
}

class PhotosVM: ObservableObject {
    @Published var photo: Photo = .init(id: -1, url: URL(string: "-")) // defualt image
    @Published var images: [Photo] = [Photo]()
    
    let url = "https://picsum.photos/200"
    
    
    // https://picsum.photos/id/x/5000/3269
    
    func fetchMultiple(count: Int = 4) {
        let multiURL = "https://picsum.photos/id"
        
        images = (0..<count).compactMap { i in
            let myURL = "\(multiURL)/\(i + 1)/5000/3333"
            let url = URL(string: myURL)
            return Photo(id: i, url: url)
        }
        
        print(images)
        print(images[0])
        
        
    }
    
    func fetchPhotos(){
        guard let url = URL(string: url) else {
            print("Invalid url")
            return
        }
        
        photo = Photo(id: 1, url: URL(string: url.absoluteString))
    }
}


