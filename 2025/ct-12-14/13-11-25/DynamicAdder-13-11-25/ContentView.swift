//
//  ContentView.swift
//  DynamicAdder-13-11-25
//
//  Created by Filip Vabroušek on 13.11.2025.
//

import SwiftUI

class Post: Identifiable {
    var id: UUID = UUID() // unique used in List
    var title: String
    var date: Date
    
    init(title: String, date: Date) {
        self.title = title
        self.date = date
    }
}

struct ContentView: View {
    @EnvironmentObject var controller: Controller
    // @State var posts: [Post] = []
    // Lift the state from posts array to environmentObject
    
    @State var text = ""
    @State var date: Date = .now


    @State var isShown: Bool = false
    
  
    // confirmationDialog
    func addPost() {
        if text.isEmpty {
            isShown.toggle()
            return
        }
        
        let post = Post(title: text, date: date)
       // posts.append(post)
      //  controller.items.append(post)
        controller.addPost(post: post)
        
        text = ""
    }
    
    var body: some View {
        VStack {
            
            HStack {
                TextField("Post title", text: $text)
                Button("Add post"){
                    self.addPost()
                }
            }
            
            Text("Add a date")
            
            DatePicker("Date", selection: $date)
          
            List(controller.items) { post in
                Text(post.title)
                Text(post.date.formatString())
                Text(post.date.dayOfYear())
                
                Image("2027-iphone")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200, height: 200)
            }.confirmationDialog(
                Text("Please enter some text"),
                isPresented: $isShown,
                titleVisibility: .visible) {
                
                Text("Ple")
                Button("OK"){
                    
                }
            }
            
            
            
            
        }
    }
}


extension Date {
    func formatString() -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.dateFormat = "dd/MM/YYYY"
        return formatter.string(from: self)
    }
    
    
    func dayOfYear() -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.dateFormat = "DD"
        return "\(formatter.string(from: self))th day of the year"
    }
    
    var formatteds: String {
        self.formatString()
    }
}

#Preview {
    ContentView()
}
