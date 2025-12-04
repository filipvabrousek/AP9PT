//
//  Sheet_04_12_25_v1App.swift
//  Sheet-04-12-25-v1
//
//  Created by Filip Vabroušek on 04.12.2025.
//

import SwiftUI
import Combine

class Store: ObservableObject {
    @Published var text = ""
}

@main
struct Sheet_04_12_25_v1App: App {
    let store = Store()
    
    var body: some Scene {
        WindowGroup {
            SheetView()
                .environmentObject(store)
        }
    }
}

struct SheetView: View {
    @EnvironmentObject var store: Store
    @State var isShown = false
    
    var body: some View {
        Button("Sheet"){
            store.text = "Hello"
            isShown.toggle()
        }.sheet(isPresented: $isShown) {
            InnerView()
        }
    }
}


struct InnerView: View {
    @EnvironmentObject var store: Store
    var body: some View {
        Text(store.text).bold()
    }
}
