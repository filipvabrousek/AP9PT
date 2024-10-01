//
//  ContentView.swift
//  AP9PT-ToDo-01-10-24
//
//  Created by student on 01.10.2024.
//

import SwiftUI

struct TasksView: View {
    @State var text = ""
    @State var items = [String]()
    @State var isShown = false
    
    // var isShown: Bool = false
    // var name: String = "Eda"
    // let pi: Double = 3.141592
    // let pi: Float = 3.141592 - we don't have to use it
    // String name = "Eda" C#
    // let name: string = "Eda" TS
    
    var body: some View {
        VStack(alignment: .leading){
            Text("Tasks")
                .font(.system(size: 50,
                              weight: .black,
                              design: .rounded))
                .foregroundStyle(.green)
                .padding()
            
            HStack {
                TextField("Enter the task", text: $text)
                   
               
                Button("+"){
                    if text.isEmpty {
                        isShown.toggle()
                    } else {
                        items.append(text)
                        text = ""
                    }
                   
                }.bold()
                 .foregroundStyle(.green)
                
            }.padding()
            .font(.title3)
            
            
           /* List {
                ForEach(items, id: \.self){ item in
                    Text(item)
                }
            }*/
            
            List(items, id: \.self){ item in
                Text(item)
            }.listStyle(.plain)
            
        }.alert("Please fill-in data", isPresented: $isShown) {
            Button("Ok"){
                
            }
        }
    }
}



struct NextView: View {
    var gradient: Gradient {
        Gradient(colors: [.green, .orange])
    }
    
    var radialGrad: RadialGradient {
        RadialGradient(colors: [.green, .blue],
                       center: .center,
                       startRadius: 20,
                       endRadius: 120)
    }
    
    @State var scale = 1.0
    @State var angle = 0.0
    
    var body: some View {
        RoundedRectangle(cornerRadius: 25) // Rectangle
            .frame(width: 300, height: 300)
            .padding(20)
            .foregroundStyle(radialGrad)
            .scaleEffect(scale)
            .rotationEffect(Angle(degrees: angle))
            .shadow(color: Color.green, radius: 100)
            .onTapGesture {
                withAnimation(Animation.easeInOut(duration: 3.0)) {
                    if scale == 3.0 {
                        scale = 1.0
                        angle = 0
                    } else {
                        scale = 3.0
                        angle = 360
                    }
                        
                }
               
            }
    }
}

// protocol Shape own shape

struct MyView: View {
    @State var isShown = false
    @State var animAmount = 0.7
    var body: some View {
        VStack {
            
            
            Circle().onTapGesture {
                
            
                
               /* withAnimation(Animation.spring(Spring(duration: 1, bounce: 1), blendDuration: 0.5)){
                    isShown.toggle()
                }*/
                animAmount += 0.25
            }.scaleEffect(animAmount)
            .animation(Animation.spring(Spring(duration: 1, bounce: 1), blendDuration: 0.5), value: animAmount)
         
            if isShown {
                Text("Hello")
            }
            
        }.font(.title)
    }
}
