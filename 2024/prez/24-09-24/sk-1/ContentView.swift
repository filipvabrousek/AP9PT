//
//  ContentView.swift
//  Tasks-to-do-AP9PT
//
//  Created by student on 30.09.2024.
//

import SwiftUI

struct TasksView: View {
    @State var text = ""
    @State var tasks = [String]()
    @State var isShown = false
    
    var body: some View {
        VStack(alignment: .leading) {
            
            Text("Tasks")
                .font(.system(size: 30, weight: .black ))
                .foregroundStyle(.green)
            
            HStack {
                TextField("Enter a task", text: $text)
                
                Button("+"){
                    if text.isEmpty {
                        isShown.toggle()
                    } else {
                        tasks.append(text)
                        text = ""
                    }
                    
                }
            }.padding()
            // .border(Color.green, width: 7)
            
            List {
                ForEach(tasks, id: \.self){ task in
                    Text(task)
                }
                
                
            }.listStyle(.plain)
            
        }.alert("Please fill-in the field", isPresented: $isShown) {
            Button("Ok"){}
        }.padding()
    }
}

#Preview {
    TasksView()
}

struct ShapeView: View {
    var gradient = LinearGradient(colors: [.green, .orange], startPoint: .leading, endPoint: .trailing)
    
    var radialGrad = RadialGradient(colors: [.green, .orange], center: .center, startRadius: 18, endRadius: 70)
    
    @State var scale: CGFloat = 1.0
    @State var rotation: CGFloat = 0.0
    
    var body: some View {
        
            //Circle()
        RoundedRectangle(cornerSize: CGSize(width: 26.0,
                                            height: 26.0))
                .frame(width: 200, height: 200)
                .padding()
                .foregroundStyle(radialGrad)
                .opacity(0.9)
                .scaleEffect(scale)
                .rotationEffect(Angle(degrees: rotation))
                .shadow(color: Color.blue, radius: 20.0)
                .onTapGesture {
                    withAnimation(.easeInOut(duration: 1.0)) {
                        if scale == 3.0 {
                            scale = 1.0
                            rotation = 0
                        } else {
                            scale = 3.0
                            rotation = 360
                        }
                    }
                }
        
            
           
        
        // background - pozadí
    }
}


struct MyNextView: View {
    var body: some View {
        
        VStack {
            
            
            GeometryReader { proxy in
                Circle().frame(width: proxy.size.width * 0.1)
            }
            
            Circle().frame(width: UIScreen.main.bounds.width * 0.1)
        }
    }
}
