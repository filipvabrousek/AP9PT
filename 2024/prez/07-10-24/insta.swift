//
//  ContentView.swift
//  AP9PT-Feed-07-10-24
//
//  Created by student on 07.10.2024.
//

import SwiftUI


struct FeedView: View {
    @State var items = ["A", "B", "C"]
    
    var body: some View {
        List(items, id: \.self) {_ in
            InstaCell()
        }.listStyle(.plain)
            .edgesIgnoringSafeArea(.horizontal)
    }
}

/*
 fetch("https://dummyjson.com/posts")
 .then(res => res.json())
 .then(console.log)
 */

struct InstaCell: View {
    var body: some View {
        VStack {
            
            TopBar()
                
            Image("artemis")
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            BottomBar()
            PostView()
            CommentsView()
            // .edgesIgnoringSafeArea(.all)
        }
          
    }
}

struct BottomBar: View {
    @State var pulse = 1.0
    
    var body: some View {
        VStack(alignment: .leading) {
            
            
            HStack {
                Button(action: {
                    print("Liked \(pulse)")
                    pulse += 1.0
                }, label: {
                    Image(systemName: "heart")
                })
               // .symbolEffect(.bounce, value: pulse)
                   
                
                Button(action: {
                    print("Comment")
                }, label: {
                    Image(systemName: "bubble")
                })
                
                Button(action: {
                    print("Send")
                }, label: {
                    Image(systemName: "paperplane") // SFSymbols
                })
                
                Spacer()
                
                Button(action: {
                    print("Bookmark")
                }, label: {
                    Image(systemName: "bookmark") // SFSymbols
                })
                
            }.foregroundStyle(Color("dotsColor"))
               
                .font(.title3)
            
            Text("Liked by **Spacecase** and **1969** others")
                .padding(.top, 10)
        } .padding([.leading, .trailing])
        
    
    }
}


struct PostView: View {
    var body: some View {
        Text("NASA and SpaceX are standing down from the Thursday, Oct. 10, launch attempt of the agency’s Europa Clipper mission due to anticipated hurricane conditions in the area. Hurricane Milton is expected to move from the Gulf of Mexico this week moving east to the Space Coast. High winds and heavy rain are expected in the Cape Canaveral and Merritt Island regions on Florida’s east coast. Launch teams have secured NASA’s Europa Clipper spacecraft in SpaceX’s hangar at Launch Complex 39A at the agency’s Kennedy Space Center in Florida ahead of the severe weather, and the center began hurricane preparations Sunday.")
            .padding([.leading, .trailing])
            .padding(.top, 10)
            .font(.caption)
    }
}

struct CommentsView: View {
    var body: some View {
        HStack {
            
            
            VStack(alignment: .leading) {
                Text("**Filip Vabrousek** I was looking forward to it, nooooooooo!")
                Text("**Filip Vabrousek** Nooooooooo!")
                Text("**Filip Vabrousek** Why?!!!!")
            }.font(.caption)
                .padding(.top, 10)
                .padding([.leading, .trailing])
            
            Spacer()
        }
    }
}


struct TopBar: View {
    var body: some View {
        HStack {
            Image("nasa")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50)
            
            VStack(alignment: .leading) {
                Text("NASA")
                Text("The freakin' Moon")
            }
            
            Spacer()
            
            Button("..."){
                
            }.bold()
            .foregroundStyle(Color("dotsColor"))
            .padding()
        }
    }
}

#Preview {
    InstaCell()
}


