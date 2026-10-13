//
//  MySlider.swift
//  BMI
//
//  Created by Filip Vabroušek on 13.10.2026.
//

import SwiftUI

struct MySlider: View {
    @State var value = 0.0
    
    var body: some View {
        Slider(value: $value, in: 0...100)
        Text("\(Int(value))")
    }
}


struct TextView: View {
    @State var text = ""
    
    var body: some View {
        TextField("Enter some text", text: $text)
        Text(text)
    }
}




#Preview {
    TextView()
}
