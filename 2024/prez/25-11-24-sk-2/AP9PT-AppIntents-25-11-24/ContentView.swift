//
//  ContentView.swift
//  AP9PT-AppIntents-25-11-24
//
//  Created by Filip Vabroušek on 11/25/24.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var fetcher: Passer
    
    var body: some View {
        VStack {
            Text("Task")
            List(fetcher.tasks, id: \.self){ task in
                Text(task)
            }
        }.onAppear {
            //let fetcher = Passer()
            fetcher.fetch()
            print("FETCHED")
            
            print(fetcher.tasks)
            
            print("FILTERING")
            
            
            
            let filtered = fetcher.filter(by: "Fi")
            print(filtered)
            
            
        }
    }
}

#Preview {
    ContentView()
}
