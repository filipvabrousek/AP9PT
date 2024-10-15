//
//  ShareData_15_10_24App.swift
//  ShareData-15-10-24
//
//  Created by student on 15.10.2024.
//

import SwiftUI

// Fetcher.fetch(url)
class SharedData: ObservableObject {
    @Published var counter: Int = 0 // call fetcher here
}

struct AView: View {
    @EnvironmentObject var shared: SharedData
    
    var body: some View {
        
        VStack {
            Button("Increase counter"){
                shared.counter += 1
            }.foregroundStyle(Color("MyColor"))
            
            // BView(shared: shared)
            // in BView @ObservedObject var shared: SharedData
            
            BView()
            CView()
        }.font(.largeTitle)
    }
}


struct MyDesign: View {
    @State var progress = 0.0
    @State var radius = 0.0
    @State var scale = 1.0
    @State var bounceValue = 1.0
    
    var grad: AngularGradient {
        AngularGradient(stops: [
            .init(color: .green, location: progress),
            .init(color: .indigo, location: 0.3)], center: .center)
    }
    
    var body: some View {
        VStack {
            
          /*  VStack(alignment: .leading) {
                Text("Progress")
                
                Slider(value: $progress) {
                    Text("Progress")
                }
            }
           */
            
            BoundView(title: "Progress", progress: $progress)
            
            BoundView(title: "Shadow", progress: $radius)
            
            BoundView(title: "Scale", progress: $scale)
            
            
        /*    Slider(value: $radius, in: 0.0...70.0) {
                Text("Shadow")
            }
            
            Slider(value: $scale, in: 0.5...1.0)
            */
            
           // Slider(value: $bounceValue, in: 0.0...1.0)
         
            
            Circle()
                .fill(grad)
                .shadow(color: .orange,
                        radius: radius)
                .scaleEffect(scale)
                .animation(.easeInOut,
                           value: scale)
        }
       
            
    }
}


struct BoundView: View {
    var title: String
    var progress: Binding<Double>
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .foregroundStyle(.orange)
                .font(.title2)
            
            Slider(value: progress) {
                Text("Progress")
            }.foregroundStyle(.green)
        }
    }
}

struct BView: View {
   // @ObservedObject var shared: SharedData
    // BView(shared: shared)
    
    @EnvironmentObject var shared: SharedData
    
    var body: some View {
        Text("Counter is \(shared.counter)")
            .onTapGesture {
                shared.counter = 0
            }
    }
}



struct CView: View {
    @EnvironmentObject var shared: SharedData
    
    var body: some View {
        Text("Counter is \(shared.counter)")
    }
}

#Preview {
    /*AView()
        .environmentObject(SharedData())
     */
    
    MyDesign()
}

@main
struct ShareData_15_10_24App: App {
    let shared = SharedData()
    var body: some Scene {
        WindowGroup {
          /* AView()
                .environmentObject(shared)
           */
            
            MyDesign()
        }
    }
}
