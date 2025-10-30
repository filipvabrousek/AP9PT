//
//  Observable-Practice.swift
//  SharingData-30-10-25-sk2
//
//  Created by Filip Vabroušek on 30.10.2025.
//

import SwiftUI
import Combine

// 2 view connect by EnvironmentObject
// Value is counter Button("Hello") {value += 1}
// if  value > 3 => AView display Circle()
// if value > 6 BView => display Rectangle()
// <= 3 neither shows


class CounterObservable: ObservableObject {
    @Published var value: Int = 0
}


@main
struct DSharingData_30_10_25_sk2App: App {
    var sharedData = CounterObservable()
    
    var body: some Scene {
        WindowGroup {
            VStack {
               Middle().environmentObject(sharedData)
            }
            
        }
    }
}

struct Middle: View {
    @EnvironmentObject var shared: CounterObservable
    var body: some View {
        VStack {
            AAView()
            BBView()
        }
    }
}


struct AAView: View {
    @EnvironmentObject var counter: CounterObservable
    
    var body: some View {
        VStack {
            Button("Count"){
                counter.value += 1
            }
            
            if counter.value > 3 && counter.value < 6 {
                Circle().foregroundStyle(.orange)
                    .frame(width: 100)
            }
        }
        Text("Practice")
    }
}




struct BBView: View {
    @EnvironmentObject var counter: CounterObservable
    
    var body: some View {
        VStack {
            Button("Count \(counter.value)"){
                counter.value += 1
            }
            
            if counter.value > 6 {
                Rectangle().foregroundStyle(.green)
                    .frame(width: 100, height: 100)
            }
        }
        Text("Practice")
    }
}
