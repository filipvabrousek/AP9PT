//
//  SheetEnv_02_12_25_sk1App.swift
//  SheetEnv-02-12-25-sk1
//
//  Created by Filip Vabroušek on 02.12.2025.
//

import SwiftUI
import Combine

class EO: ObservableObject {
    @Published var text = ""
}

@main
struct SheetEnv_02_12_25_sk1App: App {
    let eo = EO()
    
    var body: some Scene {
        WindowGroup {
          TasksWithDelete()
                .environmentObject(eo)
        }
    }
}


struct SheetView: View {
    @EnvironmentObject var e: EO
    @State var showSheet: Bool = false
    
    var body: some View {
        Button("Sheet"){
            e.text = "Pressed"
            showSheet.toggle()
        }.sheet(isPresented: $showSheet){
            InnerView()
        }
    }
}

struct InnerView: View {
    @EnvironmentObject var e: EO
    var body: some View {
        Text(e.text).bold()
    }
}
