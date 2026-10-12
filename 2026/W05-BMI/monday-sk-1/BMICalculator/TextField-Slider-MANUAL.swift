//
//  TextField-Slider-MANUAL.swift
//  BMICalculator
//
//  Created by Filip Vabroušek on 12.10.2026.
//

import SwiftUI

struct TextView: View {
    @State var text = ""
    
    var body: some View {
        TextField("Enter some text", text: $text)
        Text(text)
            .font(.largeTitle)
    }
}

// Slider

struct SliderView: View {
    @State var value = 0.0
    
    var body: some View {
        Slider(value: $value, in: 0...21)
        Text("Slider is \(Int(value))")
    }
}





#Preview {
    SliderView()
}
