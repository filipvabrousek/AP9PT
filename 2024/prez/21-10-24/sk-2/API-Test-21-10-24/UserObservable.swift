//
//  UserObservable.swift
//  API-Test-21-10-24
//
//  Created by student on 21.10.2024.
//

/*
import SwiftUI

struct User: Identifiable, Codable {
    let id: Int
    let name: String
    let email: String
}


class UserVM: ObservableObject {
    @Published var users: [User] = []
    
    let url = "https://jsonplaceholder.typicode.com/users"
    
    func fetchUsers() {
        guard let url = URL(string: url) else {
            print("Invalid url")
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { dataa, responsea, errora in
            do {
                let decodedUsers = try JSONDecoder().decode([User.self], from: dataa!)
                
                DispatchQueue.main.async {
                    self.users = decodedUsers
                }
            } catch {
                print("Failed to decode JSON")
            }
        }
        
        task.resume()
        
      /*  let task = URLSession.shared.dataTask(with: url) { data, response, error in
            do {
                let decodedUsers = try JSONDecoder().decode([User.self], from: data!)
                
                DispatchQueue.main.async {
                    self.users = decodedUsers
                }
            } catch {
                print("Failed to decode JSON")
            }
        }*/
        
       //
        
        
        
    }
    
}
*/

import SwiftUI

struct User: Identifiable, Codable {
    let id: Int
    let name: String
    let email: String
}

class UserVM: ObservableObject {
    @Published var users: [User] = []
    
    let url = "https://jsonplaceholder.typicode.com/users"
    
    func fetchUsers() {
        guard let url = URL(string: url) else {
            print("Invalid url")
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            do {
                // [User].self
                let decodedUsers = try JSONDecoder().decode([User].self, from: data!)
                
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
