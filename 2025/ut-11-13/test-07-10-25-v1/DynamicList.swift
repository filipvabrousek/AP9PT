//
//  DynamicList.swift
//  test-07-10-25-v1
//
//  Created by Filip Vabroušek on 07.10.2025.
//

import SwiftUI


struct FeedView: View {
    var body: some View {
        List {
            CellView(name: "Eda", age: 24)
            
            UserCellView(
                user: User(name: "Eda",
                            age: 22))
            
            UserCellView(
                user: .init(name: "Karel",
                            age: 24))
        }
    }
}


struct DynamicView: View {
    var users: [User] = [
        .init(name: "Karel", age: 25),
        .init(name: "Eda", age: 25),
        .init(name: "Jana", age: 25),
    ]
    
    var body: some View {
        List(users, id: \.name){ user in
            VStack(alignment: .leading) {
                Text(user.name)
                Text("Age is \(user.age)")
                Text(user.age.string)
                Text(user.age.squared.string)
            }
        }
    }
}

struct LazyTest: View {
    var body: some View {
        LazyVStack { // for performance
            // use classic VStack unless performance issues
            ForEach(1..<1000) { i in
                Text("\(i)")
            }
            
        }
        
        // LazyHSTack
    }
}

extension Double {
    var string: String {
        "\(self)"
    }
}

extension Int {
    var string: String {
        "\(self)"
    }
    
    var squared: Double {
        Double(self * self)
    }
}

struct CellView: View {
    var name: String
    var age: Int
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(name)
            Text("\(age)")
        }.font(.largeTitle)
    }
}

struct UserCellView: View {
    var user: User
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(user.name)
            Text("\(user.age)")
        }.font(.largeTitle)
    }
}

class User {
    var name: String
    var age: Int
    
    init(name: String, age: Int){
        self.name = name
        self.age = age
    }
}

#Preview {
   DynamicView()
}

