//
//  ContentView.swift
//  SwiftUI-UIViewRepresentable
//
//  Created by Filip Vabroušek on 11/15/24.
//

import SwiftUI


struct MyRepresentable: UIViewRepresentable {
    func makeUIView(context: Context) -> UIView {
       // UIActivityIndicatorView()
        
        let label = UILabel()
        label.text = "Hello, World!"
        return label
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
        
    }
}


/*
 SwiftUI in UIKit  UIHostingController(rootView: MySwiftUIView())
 UIKit in SwiftUI MyUIKitView: UIViewRepresentable
 
 UIKit - approaches:
 Code only
 Storyboard
 
 Combine Code + storyboard
 Combine UIKit + SwiftUI in code
 Combine UIKit + SwiftUI in storyboard
 */


struct ContentView: View {
    var body: some View {
        VStack(alignment: .leading){
            Text("Hello, World!")
            MyRepresentable()
        }
        
    }
}

#Preview {
    ContentView()
}
