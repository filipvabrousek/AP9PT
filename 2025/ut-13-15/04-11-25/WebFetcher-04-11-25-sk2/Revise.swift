//
//  Revise.swift
//  WebFetcher-04-11-25-sk2
//
//  Created by Filip Vabroušek on 04.11.2025.
//

import SwiftUI

struct Revise: View {
    @State var rotation: Double = 0
    
    var body: some View {
        Text("Animated")
            .font(.largeTitle)
            .bold()
            .foregroundStyle(.green)
            .rotation3DEffect(.degrees(rotation),
                              axis: (x: 1, y: 0, z: 1))
            .onTapGesture {
                withAnimation {
                    rotation = 360
                }
            }
    }
}




struct Unique: Identifiable {
    var id: String = UUID().uuidString
    var text: String
}

struct SliderDynamic: View {
    @State var sliderValue: CGFloat = 0
    @State var words: [Unique] = []
    
    var body: some View {
        VStack {
            
            Slider(value: $sliderValue, in: 0...100) {
                
            }.onChange(of: sliderValue) { oldValue, newValue in
                print(newValue)
            
                words.append(.init(text: "Hello \(Int(newValue))"))
                
            }
            
            ScrollView {
                ForEach(words, id: \.id) { w in
                    Text(w.text)
                }
            }
            
        }
    }
}
