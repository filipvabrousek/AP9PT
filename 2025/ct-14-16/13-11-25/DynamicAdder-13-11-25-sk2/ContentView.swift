//
//  ContentView.swift
//  DynamicAdder-13-11-25-sk2
//
//  Created by Filip Vabroušek on 13.11.2025.
//

import SwiftUI
import Combine

class Store: ObservableObject {
    @Published var items = [Item]()
    
    func addItem(item: Item){
        items.append(item)
    }
}

// lift state up
struct Item: Identifiable {
    var id: UUID = UUID()
    var title: String
    var date: Date
    
    init(title: String, date: Date) {
        self.title = title
        self.date = date
    }
}

struct ContentView: View {
    @EnvironmentObject var store: Store
    
    @State var text = ""
    @State var items: [Item] = []
    @State var date: Date = .now
    @State var showDialog: Bool = false
    
    var body: some View {
        VStack {
            TextField("Set a title", text: $text)
            
            DatePicker("Pick a date", selection: $date)
            
            Button("Add an item"){
                if text.isEmpty {
                    showDialog.toggle()
                    return
                }
                
                    let item = Item(title: text,
                                    date: .now)
               // store.items.append(item)
                store.addItem(item: item)
                
                
            }
            
            
            List(store.items, id: \.id){ item in
                VStack(alignment: .leading) {
                    Text(item.title)
                    Text(item.date.formattedDate())
                    Text(item.date.dayOfYear())
                }
            }
            
            // shows on macOS
            .confirmationDialog("Please fill-in some text", isPresented: $showDialog, titleVisibility: .visible) {
                // Text("Please fill-in some text")
                Button("OK"){
                    
                }
            }
        }.padding()
        
    }
}

extension Date {
    func formattedDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.dateFormat = "dd/MM/YYYY" // DD => days since NYE
        return dateFormatter.string(from: self)
    }
    
    func dayOfYear() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.dateFormat = "DD" // DD => days since the NYE
        return "\(dateFormatter.string(from: self)) days since NYE"
    }
}

#Preview {
    ContentView()
}
