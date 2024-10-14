//
//  ContentView.swift
//  macTest
//
//  Created by student on 14.10.2024.
//

import SwiftUI

struct AView: View {
    @EnvironmentObject var data: SharedData
    var body: some View {
        VStack {
           // Text("View A")
            
          /*  Button("Change value"){
                data.counter += 1
            } */
            
            CView()
            
            BView()
        }
    }
}

struct BView: View {
    @EnvironmentObject var data: SharedData
    var body: some View {
        VStack {
            Text("View B")
            Text("Counter is \(data.counter)")
        }
    }
}


struct CView: View {
    @EnvironmentObject var data: SharedData
    @State var show = false
  
    var body: some View {
        VStack {
            Text("View C")
            Button("Change value"){
                data.counter += 1
                if (data.counter > 20){
                    show.toggle()
                }
            }
            
            
        }.alert(isPresented: $show) {
            Alert(title: Text("Count is over 20"), primaryButton: .default(Text("Ok")), secondaryButton: .cancel())
        }
    }
}


class Task: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(date)
    }
    
    var title: String
    var date: Date
    init(title: String, date: Date){
        self.title = title
        self.date = date
    }
    
    static func == (lhs: Task, rhs: Task) -> Bool {
        lhs.date == rhs.date
    }
}

struct TasksView: View {
    @State var items = [Task]()
    @State var text = ""
    @State var show = false
    
    var body: some View {
        VStack(alignment: .leading){
            
            TextField("Enter a task", text: $text)
            
            Button("Add"){
                if text.isEmpty {
                    show.toggle()
                } else {
                    let item = Task(title: text, date: .now)
                    items.append(item)
                    text = ""
                }
            }
            
            List(items, id: \.self){item in
                    VStack(alignment: .leading){
                        Text(item.title)
                    }
            }
        }.alert(isPresented: $show) {
            Alert(title: Text("Please enter some text"), primaryButton: .default(Text("Ok")), secondaryButton: .cancel())
        }
    }
}

struct ContentView: View {
    @State var counter = 0
    
    var body: some View {
        VStack {
            Button("Count"){
                counter += 1
            }
            
            Text("Count is \(counter)").font(.largeTitle)
        }
    }
}

#Preview {
    ContentView()
}
