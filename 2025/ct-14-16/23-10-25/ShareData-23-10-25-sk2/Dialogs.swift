//
//  Dialogs.swift
//  ShareData-23-10-25-sk2
//
//  Created by Filip Vabroušek on 23.10.2025.
//

import SwiftUI

struct Dialogs: View {
    @State var showDialog = false
    
    var body: some View {
        Button("Show dialog"){
            showDialog.toggle()
        }.alert("Hello", isPresented: $showDialog) {
            Button("Ok"){
                
            }
        }
    }
}



struct ActionView: View {
    @State var showActionSheet = false
    
    var body: some View {
        ZStack {
            
            Image("sea")
                .resizable()
                .frame(width: 300, height: 300)
            
            Button("Action sheet"){
                self.showActionSheet.toggle()
            }.confirmationDialog("Confirms",
                                 isPresented: $showActionSheet) {
                Button("Okay"){
                }
                
                Button("Delete account"){}
                
                Button("Log out"){
                    
                }
            }
            
           
            
            
        }
    }
}



