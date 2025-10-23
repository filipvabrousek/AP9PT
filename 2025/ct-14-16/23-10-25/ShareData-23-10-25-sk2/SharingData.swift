//
//  SharingData.swift
//  ShareData-23-10-25-sk2
//
//  Created by Filip Vabroušek on 23.10.2025.
//

import SwiftUI
import Combine

class SharedData: ObservableObject {
  @Published var counter = 0
}

@main
struct ShareData_23_10_25_sk2App: App {
    let store = SharedData()
    
    var body: some Scene {
        WindowGroup {
            DynamicNavigationView()
           // NavView()
          //  ActionView()
          //  Dialogs()
        //  WrapperView() // supports Store
                .font(.largeTitle)
                //.bold()
                .environmentObject(store)
        }
    }
}

struct WrapperView: View {
    @EnvironmentObject var store: SharedData
    var body: some View {
        VStack {
            Spacer()
            AView(store: store).border(Color.orange)
            
            Spacer()
            BView().border(Color.green)
            Spacer()
        }.font(.largeTitle)
    }
}

struct AView: View {
    // ObservedObject is not automatically passed
    @ObservedObject var store: SharedData
    var body: some View {
        VStack {
            Text("Value is \(store.counter)")
            
            Button("Increase by AView") {
                store.counter += 1
            }
        }
    }
}

struct BView: View {
    @EnvironmentObject var store: SharedData
    var body: some View {
        Text("Value is \(store.counter)")
        
        Button("Increase by BView") {
            store.counter += 1
        }
    }
}

#Preview {
    WrapperView()
        .environmentObject(SharedData())
}
