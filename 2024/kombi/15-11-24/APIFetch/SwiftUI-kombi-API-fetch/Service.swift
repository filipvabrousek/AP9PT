//
//  Service.swift
//  SwiftUI-kombi-API-fetch
//
//  Created by Filip Vabroušek on 11/15/24.
//

import SwiftUI

class User: Codable, Identifiable {
    let id: Int
    let name: String
    let email: String
}


class InnerFetcher {
    
    static func fetchUsers(completion: @escaping ([User]) -> Void){
        let url = "https://jsonplaceholder.typicode.com/users"
        
        guard let url = URL(string: url) else {
            print("Invalid URL")
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            do {
                let decodedUsers = try JSONDecoder().decode([User].self, from: data!)
                print("I got \(decodedUsers.count)")
                
                DispatchQueue.main.async {
                    completion(decodedUsers)
                   // self.users = decodedUsers
                }
            } catch {
                print("Failed to decode JSON \(error.localizedDescription)")
            }
        }
        
        task.resume()
        
        
        
        
        
        
        
    }
}


class Fetcher: ObservableObject {
    @Published var users = [User]()
    

    func fetchUsers(){
      InnerFetcher.fetchUsers { users in
            self.users = users
        }
        
        
        
        
        
        
      /*  let url = "https://jsonplaceholder.typicode.com/users"
        
        guard let url = URL(string: url) else {
            print("Invalid URL")
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            do {
                let decodedUsers = try JSONDecoder().decode([User].self, from: data!)
                print("I got \(decodedUsers.count)")
                
                DispatchQueue.main.async {
                    self.users = decodedUsers
                }
            } catch {
                print("Failed to decode JSON \(error.localizedDescription)")
            }
        }
        
        task.resume()
        
        
        
        */
        
        
        
    }
    
}
