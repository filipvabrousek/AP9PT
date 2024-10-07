//
//  ContentView.swift
//  Feed-07-10-24-AP9PT-sk-2
//
//  Created by student on 07.10.2024.
//

import SwiftUI


struct FeedView: View {
    @State var items = ["A", "B", "C"]

    var body: some View {
        List(items, id: \.self){ item in
            InstaCell()
        }.listStyle(.plain)
    }
}




struct InstaCell: View {
    var body: some View {
        VStack(alignment: .leading) {
            TopBar()
            PostImage()
            BottomBar()
            DescriptionView()
            CommentsView()
        }
    }
}



struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        // Define the points of the triangle
        path.move(to: CGPoint(x: rect.midX, y: rect.minY)) // Top point
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY)) // Bottom right
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY)) // Bottom left
        path.closeSubpath() // Close the path to create the triangle
        
        return path
    }
}

extension View {
    func triangle() -> some View {
        self.clipShape(Triangle())
    }
}


struct PostImage: View {
    var body: some View {
        Image("europa-clipper")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .triangle()
          //  .clipShape(Triangle())
    }
}


struct BottomBar: View {
    @State var pulse = 1.0
    @State var isLiked = false
    
    var body: some View {
        
        Group {
            HStack {
                Button {
                    print("Liked")
                    pulse += 1.0
                    isLiked.toggle()
                } label: {
                    Image(systemName: isLiked ? "heart.fill" : "heart") // SF Symbols
                }.symbolEffect(.bounce, value: pulse)
                    .foregroundStyle(isLiked ? Color.red : Color("FeedColor"))
                
                Button {
                    print("Liked")
                } label: {
                    Image(systemName: "bubble") // SF Symbols
                }
                
                Button {
                    print("Liked")
                } label: {
                    Image(systemName: "paperplane") // SF Symbols
                }
                
                
                Spacer()
                Button {
                    print("Liked")
                } label: {
                    Image(systemName: "bookmark") // SF Symbols
                }
                
                
                
            }.foregroundStyle(Color("FeedColor"))
                .font(.title3)
                .padding(.top)
                //.padding([.leading, .trailing])
            
            
            Text("Liked by **SpaceCase** and **1969** others")
                .padding(.top, 10)
               
        } .padding([.leading, .trailing])
        
    }
}



struct DescriptionView: View {
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
            VStack(alignment: .leading){
                Text("**Filip Vabrousek** I was looking forward to it, nooooooo.")
                Text("**Filip Vabrousek** Noooo....")
                Text("**Filip Vabrousek** Why?!!!")
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
            
            VStack(alignment: .leading){
                Text("NASA")
                Text("The freaki'n Moon")
            }
            
            Spacer()
            
            Button("..."){
                
            }
          
        }.padding()
    }
}

#Preview {
    FeedView()
}
