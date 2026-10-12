//
//  MyField.swift
//  BMICalculator
//
//  Created by Filip Vabroušek on 12.10.2026.
//

import SwiftUI

struct MySlider: View {
    @State var value = 0.0

    var body: some View {
        Slider(value: $value, in: 0...100)
        Text("Value is \(Int(value))")
    }
}


struct MyField: View {
    @State var value: String = ""
    
    var body: some View {
        VStack(alignment: .leading){
            TextField("Enter your name", text: $value)
            Text(value)
                .foregroundStyle(.orange)
            
            
            
           
        }.font(.largeTitle)
        
        // Add a button that verifies the password in the textfield
        
        
        
    }
}



struct PasswordVerify: View {
    @State var value: String = ""
    var pass = "A24"
    
    var body: some View {
        VStack {
            SecureField("Enter password", text: $value)
                .border(value == pass ? .green : .gray, width: 3)
            
            Button("Verify password"){
                if value == pass {
                    print("Success")
                }
            }
        }.font(.largeTitle)
        
        
    }
}

// to-do List

struct AlertView: View {
    @State var show = false
    
    var body: some View {
        Button("Show alert"){
            show.toggle()
            // show = !show
        }.alert("Hello", isPresented: $show){
            Button("Ok"){}
        }
    }
}


struct FormattingText: View {
    var body: some View {
        Text("My title")
            .foregroundStyle(.orange)
            .font(.system(size: 60))
            .padding()
            .border(.green, width: 3)
    }
}



#Preview {
   FormattingText()
}
