//
//  OurBMI.swift
//  BMICheck
//
//  Created by Filip Vabroušek on 15.10.2026.
//

import SwiftUI

struct MyBMI: View {
    @State var height: Double = 0
    @State var weight: Double = 0
    
    var bmi: Double {
        weight / (height * height)
    }
    
    var body: some View {
        VStack {
            Text("Height: \(height)")
            Slider(value: $height, in: 0...2)
            
            Text("Weight \(weight)")
            Slider(value: $weight, in: 0...300)
            
            if !bmi.isNaN {
                Text("BMI is \(bmi)")
            }
            
        }
    }
}


// TextField + button instead of slider
//TextField("Enter something", text: $text)

struct FieldView: View {
    @State var weight: String = ""
    @State var height: String = ""
    @State var result: String = ""

    var bmi: String {
        if let weight = Double(weight) {
            if let height = Double(height) {
                return String(weight / (height * height))
            }
        }
        
      //let res = Double(weight)! / (Double(height)! * Double(height)!)
        // return String(res)
        return "Invalid data"
    }

    var body: some View {
        // Make next view, use Binding to extract field
        
       Extracted(weight: $weight, height: $height)
        
        Button("Calculate"){
            result = bmi
        }
        
        Text(result)
    }
}



struct AlertView: View {
    @State var showDialog = false
    
    var body: some View {
        Button("Show dialog"){
            showDialog.toggle()
        }.alert("Success", isPresented: $showDialog){
            Button("OK"){
                
            }
        }
    }
}


// Alert


struct Extracted: View {
    var weight: Binding<String>
    var height: Binding<String>
    
    var body: some View {
        TextField("Enter weight", text: weight)
        TextField("Enter height", text: height)
    }
}
