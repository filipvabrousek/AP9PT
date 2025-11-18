//
//  DynamicAdder_18_11_25_sk1App.swift
//  DynamicAdder-18-11-25-sk1
//
//  Created by Filip Vabroušek on 18.11.2025.
//

import SwiftUI
import Combine
import AudioToolbox

class Store: ObservableObject {
    @Published var posts: [Post] = []
}

@main
struct DynamicAdder_18_11_25_sk1App: App {
    var store = Store()
    
    var body: some Scene {
        WindowGroup {
            TabView {
                FeedView()
                    .tabItem {
                       Label("Sun", systemImage: "sun.min.fill")
                    }
                     .environmentObject(store)
                
                CountView()
                    .tabItem {
                       Label("Sun", systemImage: "sun.min.fill")
                    }
                     .environmentObject(store)
            }
           
        }
    }
}

struct CountView: View {
    @EnvironmentObject var store: Store
    var body: some View {
        Text("User has \(store.posts.count) posts")
            .font(.title)
            .bold()
    }
}

struct Post: Identifiable, Hashable {
    var id = UUID()
    
    var title: String
    var date: Date
    init(title: String, date: Date) {
        self.title = title
        self.date = date
    }
}

// Simple system sound player for lightweight clicks
enum SoundPlayer {
    // 1104 is the standard "Tock" keyboard click; you can try 1103/1105 as well.
    static let clickSoundID: SystemSoundID = 1104
    
    static func playClick() {
        AudioServicesPlaySystemSound(clickSoundID)
    }
}

struct FeedView: View {
    @State var date: Date = .now
    @State var text = ""
    @EnvironmentObject var store: Store
    
    var body: some View {
        VStack {
            DatePicker("Select a date", selection: $date)
            TextField("Enter a title", text: $text)
            
            TextField("Enter a title", text: .constant("Constant for prototype"))
            
            Button("Add post"){
                let post = Post(title: text, date: date)
                store.posts.append(post)
                
                // Play a light click sound on tap
                SoundPlayer.playClick()
            }
            
            List(store.posts, id: \.self){ post in
                VStack(alignment: .leading){
                    Text(post.title)
                    Text(post.date.simple())
                    Image("M3E")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 300)
                }
            }.listStyle(.plain)
        }
        .font(.largeTitle)
    }
}

extension Date {
    func simple() -> String {
        let df = DateFormatter()
        df.dateFormat = "dd/MM/yyyy" // DD days since NYE
        return df.string(from: self)
    }
}
