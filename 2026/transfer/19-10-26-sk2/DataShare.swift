//
//  DataShare.swift
//  19-10-26-sk2
//
//  Created by Filip Vabroušek on 19.10.2026.
//

import SwiftUI

@Observable
class Shared {
    var counter: Int = 0
    var isShown = false
}

struct Root: View {
    var shared = Shared()
    
    var body: some View {
        Text("shared is \(shared.counter)")
        ChildView().environment(shared)
        SiblingView().environment(shared)
    }
}


struct ChildView: View {
    @Environment(Shared.self) var sh
  
    var body: some View {
        @Bindable var shared = sh
        
        
        Button("Increase"){
            sh.counter += 1
            
            if (sh.counter > 3){
                sh.isShown = true
            }
            // counter > 3 => show the sheet
        }.sheet(isPresented: $shared.isShown){
            Text("Text")
        }
    }
}
// hread 1: Fatal error: No Observable object of type Shared found. A View.environmentObject(_:) for Shared may be missing as an ancestor of this view.

struct SiblingView: View {
    @Environment(Shared.self) var sh
    
    var body: some View {
        Button("Decrease"){
            sh.counter -= 1
        }
    }
}


