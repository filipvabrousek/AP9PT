//
//  Service.swift
//  APITest-22-10-24
//
//  Created by student on 22.10.2024.
//

import SwiftUI

class User: Codable, Identifiable {
    let id: Int
    let name: String
    let email: String
}



class Fetcher: ObservableObject {
    @Published var users = [User]()
    
    func fetchUser(){
        let url = "https://jsonplaceholder.typicode.com/users"
        
        guard let url = URL(string: url) else {
            print("Invalid URL")
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
            do {
                let decodedUsers = try JSONDecoder().decode([User].self,
                                                            from: data!)
                DispatchQueue.main.async {
                    self.users = decodedUsers
                }
            } catch {
                print("Failed to decode JSON")
            }
        }
        
        task.resume()
    }
}
