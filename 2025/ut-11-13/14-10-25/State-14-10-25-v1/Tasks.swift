//
//  Tasks.swift
//  State-14-10-25-v1
//
//  Created by Filip Vabroušek on 14.10.2025.
//

import SwiftUI

struct Tasks: View {
    @State var text = ""
    @State var items = [String]()
    @State var isShown = false
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Tasks")
                .foregroundStyle(.blue)
                .bold()
                .font(.largeTitle)
                .padding()
            
           // TextField("Hello", text: .constant("COnstant"))
            
            HStack {
                TextField("Hello", text: $text)
                Button("Add"){
                    isShown = false
                    
                    if text.isEmpty ||
                        text.count == 0 ||
                        text.trimmingCharacters(in: .whitespacesAndNewlines).count == 0 {
                        isShown.toggle()
                        return
                    }
                    
                    items.append(text)
                    text = ""
                }
            }.padding()
            
            
            List(items, id: \.self){ item in
                CellView(text: item)
            }
        }.confirmationDialog("Please fill-in some info", isPresented: $isShown) {
            VStack {
                
                
                Text("Fill-in some info")
                
                Button("Ok"){
                    
                }
            }
            
           
        }
    }
}

struct CellView: View {
    var text: String
    
    var body: some View {
        Text(text)
            .bold()
    }
}


#Preview {
    Tasks()
}
