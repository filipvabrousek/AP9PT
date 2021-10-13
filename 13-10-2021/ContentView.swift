//
//  ContentView.swift
//  Tasks-App
//
//  Created by Student on 13.10.2021.
//

import SwiftUI

struct ContentView: View {
    @State var input: String = ""
    
    var body: some View {
        Group {
            TextField("Enter the task", text: $input)
            Text(input)
        }.padding()
    }
}



struct MyListView: View {
    var items = ["Jana", "Karel", "Filip"]
    
    var body: some View {
        List(items, id:\.self){ user in
            Text(user)
        }
    }
}

//-----------------------------------------------------
class Item {
    var content:String
    var date:String
    
    init(content: String, date: String){
        self.content = content
        self.date = date
    }
}


struct ToDoView: View {
    @State var input = ""
    @State var items = [Item]()
    
    var body: some View {
       
        NavigationView {
            
        
                VStack {
                    
                    HStack {
                        TextField("Enter the task", text: $input)
                        
                        Button("+"){
                            self.addTask()
                        }
                    }
              
               
                    List(items, id: \.date){ item in
                       
                        NavigationLink(
                            destination: DetailView(item: item),
                            label: {
                                VStack(alignment: .leading){
                                    Text(item.date)
                                    Text(item.content)
                                }
                            })
                        
                        
                    }.listStyle(PlainListStyle())
                }.padding()
            
        } // End of NavigationView
            
        

    }
    
    func addTask(){
        let df = DateFormatter()
        df.dateFormat = "dd/MM/yyyy hh:mm:ss"
        let formatted = df.string(from: Date())
        
        let item = Item(content: input,
                          date: formatted)
        
        items.append(item)
    }
}



struct DetailView: View {
    var item: Item
    
    var body: some View {
        VStack {
            Text(item.date).italic()
            Text(item.content).bold()
        }
    }
}














struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
      MyListView()
    }
}
