//
//  PerformanceStacks.swift
//  test-07-10-25-v1
//
//  Created by Filip Vabroušek on 07.10.2025.
//

import SwiftUI

struct PerformanceStacks: View {
    
    var items = (0...99).map {"Item \($0)"}
    
    let columns = [
        GridItem(.adaptive(minimum: 20))
    ]
    
    // flexible gives exact column
    let exactColumn = [
        GridItem(.flexible(minimum: 80)),
        GridItem(.flexible(minimum: 80)),
        GridItem(.flexible(minimum: 80))
    ]
    
    
    
    var body: some View {
        
        ScrollView {
            LazyVGrid(columns: exactColumn) {
                // Add your grid content here, e.g.:
                ForEach(items, id: \.self) { index in
                    Circle()
                        .fill(Color.blue)
                        .frame(height: 30)
                }
            }
            .padding()
        }
        
       
    }
}







struct PerformanceStacksHGrid: View {
    
    var items = (0...99).map {"Item \($0)"}
    
    let columns = [
        GridItem(.adaptive(minimum: 20))
    ]
    
    // flexible gives exact column
    let exactColumn = [
        GridItem(.flexible(minimum: 80)),
        GridItem(.flexible(minimum: 80)),
        GridItem(.flexible(minimum: 80))
    ]
    
    
    
    var body: some View {
        
        ScrollView(.horizontal) {
            LazyHGrid(rows: exactColumn) {
                // Add your grid content here, e.g.:
                ForEach(items, id: \.self) { index in
                    Circle()
                        .fill(Color.green)
                        .frame(height: 30)
                }
            }
            .padding()
        }
        
       
    }
}



struct Device {
    var index: Int
    var image: String
    
    init(index: Int, image: String) {
        self.index = index
        self.image = image
    }
}

struct PerformanceStacksImages: View {
    
    var items = (0...99).map {"Item \($0)"}
    
    var devices = (0...99).map {
        Device(index: $0, image: $0 % 2 == 0 ? "mac-mini" : "iPhone")
    }
    
    let columns = [
        GridItem(.adaptive(minimum: 20))
    ]
    
    // flexible gives exact column
    let exactColumn = [
        GridItem(.flexible(minimum: 80)),
        GridItem(.flexible(minimum: 80)),
        GridItem(.flexible(minimum: 80))
    ]
    
    var body: some View {
        
        ScrollView {
            LazyVGrid(columns: exactColumn) {
                // Add your grid content here, e.g.:
                ForEach(devices, id: \.index) { item in
                    Image(item.image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .grayscale(1.0)
                        .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
                        .overlay(
                            RoundedRectangle(cornerRadius: 12, style: .continuous)
                                .stroke(Color.orange, lineWidth: 2)
                        )
                        .frame(width: 30)
                }
            }
            .padding()
        }
        
       
    }
}

// MARK: - Instagram-style feed broken down into subviews

struct InstagramFeedView: View {
    
    var devices = (0...99).map {
        Device(index: $0, image: $0 % 2 == 0 ? "mac-mini" : "iPhone")
    }
    
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 24) {
                ForEach(devices, id: \.index) { item in
                    PostView(device: item)
                }
            }
            .padding(.vertical, 12)
        }
        .background(Color(.systemBackground))
    }
}

struct PostView: View {
    let device: Device
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            PostHeaderView(username: "user_\(device.index)",
                           location: "Location • Now",
                           avatarImageName: device.image)
            
            PostImageView(imageName: device.image)
            
            PostActionsView()
            
            PostMetaView(username: "user_\(device.index)",
                         postIndex: device.index)
        }
    }
}

struct PostHeaderView: View {
    let username: String
    let location: String
    let avatarImageName: String
    
    var body: some View {
        HStack(spacing: 12) {
            Image(avatarImageName)
                .resizable()
                .scaledToFill()
                .frame(width: 36, height: 36)
                .clipShape(Circle())
                .grayscale(1.0) // grayscale avatar as requested
                .overlay(
                    Circle()
                        .stroke(Color.orange, lineWidth: 2)
                )
            
            VStack(alignment: .leading, spacing: 2) {
                Text(username)
                    .font(.headline)
                Text(location)
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
            
            Spacer()
            
            Image(systemName: "ellipsis")
                .font(.headline)
                .foregroundStyle(.primary)
        }
        .padding(.horizontal)
    }
}

struct PostImageView: View {
    let imageName: String
    
    var body: some View {
        Image(imageName)
            .resizable()
            .scaledToFit()
            .grayscale(1.0)
            .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
            .overlay(
                RoundedRectangle(cornerRadius: 16, style: .continuous)
                    .stroke(Color.orange, lineWidth: 2)
            )
            .frame(maxWidth: .infinity, alignment: .center)
            .clipped()
    }
}

struct PostActionsView: View {
    var body: some View {
        HStack(spacing: 16) {
            Image(systemName: "heart")
                .font(.title3)
            Image(systemName: "bubble.right")
                .font(.title3)
            Image(systemName: "paperplane")
                .font(.title3)
            Spacer()
            Image(systemName: "bookmark")
                .font(.title3)
        }
        .padding(.horizontal)
        .foregroundStyle(.primary)
    }
}

struct PostMetaView: View {
    let username: String
    let postIndex: Int
    
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text("Liked by user_\(max(0, postIndex - 1)) and others")
                .font(.subheadline)
                .bold()
            
            Group {
                Text("\(username) ")
                    .font(.subheadline)
                    .bold()
                + Text("This is a sample caption for post \(postIndex). #swiftui #demo")
                    .font(.subheadline)
            }
            
            Text("View all \(Int.random(in: 1...120)) comments")
                .font(.footnote)
                .foregroundStyle(.secondary)
            
            Text("\(Int.random(in: 1...59)) minutes ago")
                .font(.caption)
                .foregroundStyle(.secondary)
        }
        .padding(.horizontal)
    }
}


struct DifferentName:View {
    var body: some View {
        Text("Hello")
    }
}

struct RefactWrapper:View {
    var body: some View {
        VStack {
            
        
        DifferentName()
        DifferentName()
        DifferentName()
        }
    }
}






#Preview {
    // Change which preview you want to see:
    VStack {
      //  PerformanceStacksImages()
         InstagramFeedView()
    }
}
