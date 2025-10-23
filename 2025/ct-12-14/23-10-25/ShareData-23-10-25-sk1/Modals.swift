//
//  Modals.swift
//  ShareData-23-10-25-sk1
//
//  Created by Filip Vabroušek on 23.10.2025.
//

import SwiftUI

struct Modals: View {
    @State var isPresented: Bool = false
    
    var body: some View {
        Button("Show alert"){
            isPresented.toggle()
        }/*.confirmationDialog("Hello", isPresented: $isPresented) {
            Button("Ok") {
                
            }
        }*/
        .alert("Hello", isPresented: $isPresented) {
            Button("Ok") {
                
            }
        }
    }
}

struct ModalsConfirmationDialog: View {
    @State var isPresented: Bool = false
    @EnvironmentObject var data: SharedShareData
    
    var body: some View {
        Button("Show alert"){
            isPresented.toggle()
        }
        .confirmationDialog("Hello", isPresented: $isPresented) {
            Button("Delete account", role: .destructive) {
                // Example mutation on shared data
                data.counter = 0
            }
            Button("Cancel subscription") {
                data.counter = 100
            }
            Button("OK", role: .cancel) { }
        }
    }
}
