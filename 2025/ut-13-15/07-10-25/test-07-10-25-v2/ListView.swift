//
//  ListView.swift
//  test-07-10-25-v2
//
//  Created by Filip Vabroušek on 07.10.2025.
//

import SwiftUI

struct ListView: View {
    var body: some View {
        List {
            CellView(name: "Eda", age: 26)
            CellView(name: "Eda", age: 26)
            CellView(name: "Eda", age: 26)
           
            UCellView(user: User(name: "Eda", age: 23))
            
            UCellView(user: .init(name: "Karel", age: 24))
            
            
        }
    }
}

struct CellView: View {
    var name: String
    var age: Int
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(name)
            Text("\(age)")
        }
    }
}

struct User {
    var name: String
    var age: Int
    
    init(name: String, age: Int){
        self.name = name
        self.age = age
    }
}

struct UCellView: View {
    var user: User
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(user.name)
            Text("\(user.age)")
        }
    }
}

#Preview {
    ListView()
}
