//
//  DynamicAdder_18_11_25_sk2App.swift
//  DynamicAdder-18-11-25-sk2
//
//  Created by Filip Vabroušek on 18.11.2025.
//

import SwiftUI
import Combine

@main
struct DynamicAdder_18_11_25_sk2App: App {
    let store = Store()
    
    var body: some Scene {
        WindowGroup {
            TabView {
               /*Tab("Hello", systemImage: "sun.min.fill") {
                    FeedView()
                        .environmentObject(store)
                }*/
                
                FeedView()
                    .tabItem {
                        Label("Sun", systemImage: "sun.min.fill")
                    }
                     .environmentObject(store)
                
                CountView()
                    .tabItem {
                        Label("Cloud", systemImage: "cloud")
                    }
                     .environmentObject(store)
            }
          
        }
    }
}

class Store: ObservableObject {
    @Published var posts: [Post] = []
}

struct Post: Identifiable, Hashable {
    var id = UUID()
    var text: String
    var date: Date
    init(text: String, date: Date) {
        self.text = text
        self.date = date
    }
}

struct FeedView: View {
    @State var date: Date = .now
    @State var text = ""
   // @State var posts: [Post] = []
    @EnvironmentObject var store: Store
    
    @State var showAlert = false
    
    var body: some View {
        VStack(alignment: .leading){
            
            
            DatePicker("Select a date", selection: $date)
                .padding()
            
            TextField("Enter text", text: $text)
            Button("Add"){
                if text.isEmpty {
                    showAlert.toggle()
                    return
                }
                
                let post = Post(text: text, date: date)
                store.posts.append(post)
            }
            
            List(store.posts, id: \.self){ post in
                Text(post.text)
                Text(post.date.formattedOur())
                Image("M3EA")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 300)
            }.listStyle(.plain)
                .alert("Please enter some text", isPresented: $showAlert, actions: {
                    Button("Ok"){
                        
                    }
                })
        }
        
       
        
    }
}


struct CountView: View {
    @EnvironmentObject var store: Store
    
    var body: some View {
        Text("User has made \(store.posts.count) posts")
            .font(.largeTitle)
    }
}

extension Date {
    func formattedOur() -> String {
        let df = DateFormatter()
        df.dateStyle = .full // Tuesday November 18th, 2025
        df.dateFormat = "dd/MM/YYYY" // DD => Days since NYE
        return df.string(from: self)
    }
}


// Multiplatform
//
