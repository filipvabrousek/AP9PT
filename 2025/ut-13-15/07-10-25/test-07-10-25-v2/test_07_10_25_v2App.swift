//
//  test_07_10_25_v2App.swift
//  test-07-10-25-v2
//
//  Created by Filip Vabroušek on 07.10.2025.
//

import SwiftUI

@main
struct test_07_10_25_v2App: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}


struct SimpleLazy: View {
    var body: some View {
        LazyVStack { // if you experience performance issues
            // LazyHStack
            ForEach(0..<1000){ i in
                Text("Item \(i)")
            }
            
        }
    }
}


struct LazyGrid: View {
    var items = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: items) {
                ForEach(0..<1000){ item in
                    Circle()
                        .foregroundStyle(.orange)
                        .frame(width: 40)
                }
            }
        }
    }
}




struct LazyAdaptiveGrid: View {
    var items = [
        GridItem(.adaptive(minimum: 30))
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: items) {
                ForEach(0..<1000){ item in
                    Circle()
                        .foregroundStyle(.orange)
                        .frame(width: 10)
                }
            }
        }
    }
}


struct Indexed {
    var index: Int
    var name: String
    
    init(index: Int, name: String){
        self.index = index
        self.name = name
    }
}



// Make it even cell Mac mini image, odd cell iPhone 17 image
struct LazyEvenOddGrid: View {
    
    var items = [
        GridItem(.adaptive(minimum: 40))
       
    ]
    
    var indexedItems = (0...100).map {
        Indexed(index: $0,
                name: $0 % 2 == 0 ? "mac-mini" : "iPhone")
    }
    
    var body: some View {
        ScrollView(.horizontal) {
            LazyHGrid(rows: items) {
                ForEach(indexedItems, id: \.index){ item in
                    // item.index % 2 === 0
                    
                    if item.index.isMultiple(of: 2){
                        Image("iPhone")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 30)
                    } else {
                        Image("mac-mini")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 30)
                    }
                   
                }
            }
        }
    }
}





// Make it horizontal
struct LazyHorizontalGrid: View {
    
    var items = [
        GridItem(.adaptive(minimum: 40))
       
    ]
    
    var body: some View {
        ScrollView(.horizontal) {
            LazyHGrid(rows: items) {
                ForEach(0..<260){ item in
                    Circle()
                        .foregroundStyle(.orange)
                        .frame(width: 90)
                }
            }
        }
    }
}



// Copy of LazyEvenOddGrid adapted to a single-column Instagram-style feed
struct InstagramStyleFeedView: View {
    // Reuse the same alternating data idea
    private var posts: [Indexed] = (0...100).map {
        Indexed(index: $0, name: $0.isMultiple(of: 2) ? "mac-mini" : "iPhone")
    }
    
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 0) {
                ForEach(posts, id: \.index) { post in
                    FeedPostView(post: post)
                    Divider()
                }
            }
        }
    }
}

// MARK: - Post Cell

struct FeedPostView: View {
    let post: Indexed
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            PostHeaderView(username: "user_\(post.index)")
                .padding(.horizontal)
                .padding(.top, 8)
            
            PostImageView(assetName: post.index.isMultiple(of: 2) ? "mac-mini" : "iPhone")
            
            PostActionsView()
                .padding(.horizontal)
                .padding(.top, 8)
            
            PostMetaView(
                likes: Int.random(in: 50...900),
                username: "user_\(post.index)",
                caption: "A nice caption for post \(post.index).",
                commentsCount: Int.random(in: 3...40),
                timeAgo: "2 hours ago"
            )
            .padding(.horizontal)
            .padding(.bottom, 12)
        }
    }
}

// MARK: - Subviews

struct PostHeaderView: View {
    let username: String
    
    var body: some View {
        HStack {
            Circle()
                .fill(Color.secondary.opacity(0.3))
                .frame(width: 36, height: 36)
            Text(username)
                .font(.subheadline).bold()
            Spacer()
            Image(systemName: "ellipsis")
                .foregroundStyle(.secondary)
        }
    }
}

struct PostImageView: View {
    let assetName: String
    
    var body: some View {
        GeometryReader { proxy in
            let width = proxy.size.width
            Image(assetName)
                .resizable()
                .scaledToFill()
                .frame(width: width, height: width) // square
                .clipped()
                .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
                .grayscale(1.0)
        }
        .frame(height: UIScreen.main.bounds.width)
        .padding(.horizontal) // optional: align with header/meta padding
    }
}

struct PostActionsView: View {
    var body: some View {
        HStack(spacing: 16) {
            Image(systemName: "heart")
            Image(systemName: "bubble.right")
            Image(systemName: "paperplane")
            Spacer()
            Image(systemName: "bookmark")
        }
        .font(.title3)
    }
}

struct PostMetaView: View {
    let likes: Int
    let username: String
    let caption: String
    let commentsCount: Int
    let timeAgo: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text("\(likes) likes")
                .font(.subheadline).bold()
            
            (
                Text(username + " ").font(.subheadline).bold()
                + Text(caption).font(.subheadline)
            )
            .foregroundStyle(.primary)
            
            Text("View all \(commentsCount) comments")
                .font(.footnote)
                .foregroundStyle(.secondary)
                .padding(.top, 2)
            
            Text(timeAgo)
                .font(.footnote)
                .foregroundStyle(.secondary)
        }
    }
}


#Preview {
    // LazyEvenOddGrid()
    InstagramStyleFeedView()
}
