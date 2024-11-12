//
//  SimpleBinding.swift
//  Navigation-11-11-24
//
//  Created by student on 11.11.2024.
//

import SwiftUI

struct AView: View {
    @State var count = 0
    var body: some View {
        Button("Increase"){
            count += 1
        }
        BView(boundCount: $count)
    }
}

struct BView: View {
    var boundCount: Binding<Int>
    // @Binding var boundCount: Int
    var body: some View {
        Text("Counter is \(boundCount.wrappedValue)")
            .onAppear {
                var opt: Int? = nil
                
                // opt = 7
                
                // print(opt!)
                
                if let opt = opt {
                    print(opt)
                }
                
                if opt != nil {
                    print(opt)
                }
                
                

                //  print(boundCount)
            }
    }
}
