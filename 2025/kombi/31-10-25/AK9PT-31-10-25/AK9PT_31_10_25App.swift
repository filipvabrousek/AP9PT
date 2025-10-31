//
//  AK9PT_31_10_25App.swift
//  AK9PT-31-10-25
//
//  Created by Filip Vabroušek on 31/10/25.
//

import SwiftUI

//@main
struct AK9PT_31_10_25App: App {
    var body: some Scene {
        WindowGroup {
           Text("Hello")
        }
    }
}


struct MyView: View {
    let text: String
    
    var body: some View {
        Text(text)
            .bold()
            .font(.largeTitle)
            .font(.system(.headline))
            .foregroundStyle(.orange)
    }
}


struct WrapperView: View {
    var body: some View {
        VStack {
            MyView(text: "Hello A")
            MyView(text: "Hello B")
            MyView(text: "Hello C")
        }
       
    }
}


struct FeedCell: View {
    var body: some View {
        VStack(alignment: .leading){
            Text("Filip Vabrousek").bold()
            Image("whale").resizable()
                .aspectRatio(contentMode: .fit)
            Text("Hello")
            
            HStack {
                Button {
                    print("like")
                } label: {
                    Image(systemName: "heart.fill")
                }.font(.largeTitle)
                
                Button {
                    print("like")
                } label: {
                    Image(systemName: "heart.fill")
                }.font(.largeTitle)
                
                
                Button {
                    print("like")
                } label: {
                    Image(systemName: "heart.fill")
                }.font(.largeTitle)
            }
        }
    }
}


#Preview {
    List {
        FeedCell()
        FeedCell()
        FeedCell()
    }.listStyle(.plain)
    
}
