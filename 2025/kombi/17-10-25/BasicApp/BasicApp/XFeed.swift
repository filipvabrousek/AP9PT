//
//  XFeed.swift
//  BasicApp
//
//  Created by Filip Vabroušek on 17/10/25.
//

import SwiftUI

struct XFeed: View {
    var body: some View {
        VStack(alignment: .leading) {
            
            TopBar()
            
            HorizontalScrollView()
            
            FeedList()
       
        }
    }
}



class Post {
    var author: String
    var content: String
    var date: Date
    var id: String

    init(author: String, content: String, date: Date) {
        self.author = author
        self.content = content
        self.date = date
        self.id = UUID().uuidString
    }
}

struct FeedList: View {
    var posts = [
        Post(author: "Filip",
             content: "Team built our own variant of Liquid Glass because that's how we roll at Linear",
             date: .now),
        
        Post(author: "Filip",
             content: "Team built our own variant of Liquid Glass because that's how we roll at Linear",
             date: .now),
        
        Post(author: "Filip",
             content: "Team built our own variant of Liquid Glass because that's how we roll at Linear",
             date: .now)
        
    ]
    
    var body: some View {
        List(posts, id: \.id) { post in
                PostCellView(post: post)
        }.listStyle(.plain)
    }
}

struct PostCellView: View {
    var post: Post
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(post.author)
            Text(post.content)
        }
        
       
    }
}

struct HorizontalScrollView: View {
    var body: some View {
        
        ScrollView(.horizontal){
            HStack {
                
                
                Button("For you"){
                    
                }.topBtn()
                    
                
                Button("Following"){
                    
                }.topBtn()
                
                Button("iOS developers CZ/SK"){
                    
                }.topBtn()
            }
        }
    }
}


extension View {
    func topBtn() -> some View {
        self.fontWeight(.bold)
            .foregroundStyle(.resp)
            .padding()
    }
}


struct TopBar: View {
    var body: some View {
        ZStack(alignment: .leading) {
            
          
            
            HStack {
                
                Image("x-logo")
                    .resizable()
                    .xImage()
                   
                
                
            }.frame(width: 400)
            
            Image("whale")
                .resizable()
                .xImage()
               
        }.frame(width: 400)
    }
}

struct XProfileImage: ViewModifier {
    func body(content: Content) -> some View {
        content
       // .resizable()
        .aspectRatio(contentMode: .fit)
        .frame(width: 80)
        .clipShape(.circle)
    }
}



extension View {
    func xImage() -> some View {
        // or I can repeat here
        /*
         .aspectRatio(contentMode: .fit)
         .frame(width: 80)
         .clipShape(.circle)
         */
        self.modifier(XProfileImage())
    }
}

#Preview {
    XFeed()
}
