//
//  SwiftUITestApp.swift
//  SwiftUITest
//
//  Created by Filip Vabroušek on 14.11.2025.
//

import SwiftUI

@main
struct SwiftUITestApp: App {
    var body: some Scene {
        WindowGroup {
          MyView(name: "Eda")
        }
    }
}



struct MyView: View {
    var name: String
    // CMD + Z, CMD + C, CMD + V, SHIFT + CMD + Z
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            
            Text("Hello \(name)")
                .font(.largeTitle)
                .foregroundStyle(.orange)
                .bold()
            
            
            Text("Custom font")
                .font(.system(size: 40, weight: .heavy))
        }.border(.orange, width: 3)
        
        
        HStack {
            
            
            Spacer()
            Text("Hello \(name)")
            // .font(.largeTitle)
                .foregroundStyle(.orange)
                .bold()
            Spacer()
            
            Text("Custom font")
            //.font(.system(size: 40, weight: .heavy))
            
            Spacer()
        }.border(.orange, width: 3)
        
        
        VStack {
            Spacer() // max 10
            
            Text("Hello")
            
            Group {
                Text("Cool")
                Group {
                    Text("Cool")
                    
                    Spacer()
                }
            }
        }.border(Color.green)
           
            
    }
}



struct FeedView: View {
    var body: some View {
        List {
            Text("AHHI")
            Text("AHHI")
            Text("AHHI")
        }
    }
}

struct NameList: View {
    var names = ["Eda", "Karel", "Jana"]
    
    var body: some View {
        List(names, id: \.self){ name in
            Text(name)
        }
    }
}

struct P: Identifiable {
    var id = UUID()
    var name: String = ""
}



struct StructNameList: View {
    var names = ["Eda",
                 "Karel",
                 "Jana"]
        .map {
            P(name: $0)
        }
    
    var body: some View {
        List(names, id: \.id){ person in
            Text(person.name)
        }
    }
}

struct ProfileImage: View {
    var body: some View {
        Circle()
             .foregroundStyle(.orange
             )
              .frame(
                width: 70,
                height: 70
              )
    }
}


struct NamePart: View {
    var body: some View {
        VStack(alignment: .leading){
            Text("Hello")
                .bold()
            Text("@Cool")
                .foregroundStyle(.gray)
                .padding([.leading, .trailing])
                .border(Color.orange, width: 3)
                .padding([.leading, .trailing])
                .padding([.leading, .trailing])
                
                
                
        }
    }
}

struct XFeedCell: View {
    var body: some View {
        VStack(alignment: .leading) {
            
        HStack {
            ProfileImage()
            NamePart()
            Spacer()
        }.padding()
            
            Text("jiofehio wfhewiof hieowh fwoifh ewiohf ewioh fewioh feiowh fewio hfewioh feiowh feowih fewoih fewioh feoiwfh ").padding()
            
           
            
            
            
        }
        
        Image("whale")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 400)
        
        HStack {
           
            Button {
                print("Here")
            } label: {
                Image(systemName: "heart.fill")
            }
            
            Button {
                
            } label: {
                Image(systemName: "heart.fill")
            }
            
            Button {
                
            } label: {
                Image(systemName: "heart.fill")
            }
                
                
        }
            
    }
}


#Preview {
    List {
        ForEach(0..<1000){ item in
            XFeedCell()
        }
    }.listStyle(.plain)
  
}
