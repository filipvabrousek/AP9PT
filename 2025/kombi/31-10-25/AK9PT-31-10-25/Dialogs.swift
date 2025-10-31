//
//  Dialogs.swift
//  AK9PT-31-10-25
//
//  Created by Filip Vabroušek on 31/10/25.
//

import SwiftUI

struct AlertView: View {
    @State var show = false
    
    var body: some View {
        Button("Show alert"){
            show.toggle()
        }/*.alert("Hello", isPresented: $show) {
            Button("Ok"){}
        }*/.sheet(isPresented: $show) {
            Text("Hello")
        }
    }
}

#Preview {
    AlertView()
}
