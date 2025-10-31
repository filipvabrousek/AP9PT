//
//  SharedData.swift
//  AK9PT-31-10-25
//
//  Created by Filip Vabroušek on 31/10/25.
//

import SwiftUI
import Combine

// 1 ---- Define shared datastore
class Store: ObservableObject {
    @Published var name: String = "default"
    
    var timer: Timer?
    @Published var elapsed = 0
    
    var elapsedString: String {
        let minutes = elapsed / 60
        let seconds = elapsed % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
    
    init(){
        Timer.scheduledTimer(withTimeInterval: 1.0,
                             repeats: true) { timer in
            self.elapsed += 1
        }
    }
}

// 2 ----- In main App struct make and instance and pass as an environmentObject
@main
struct MyApp: App {
    let store = Store()
    
    var body: some Scene {
        WindowGroup {
          MyViewS()
                .environmentObject(store)
        }
    }
}

struct MyViewS: View {
   // @EnvironmentObject var store: Store
    var body: some View {
        AView().font(.largeTitle)
        BView().font(.largeTitle)
    }
}


struct AView: View {
    @EnvironmentObject var store: Store
    
    var body: some View {
        Text("A View \(store.name)")
        Text(store.elapsedString).bold()
        Button("Change"){
            store.name = "Hello from A"
        }
    }
}

struct BView: View {
    @EnvironmentObject var store: Store
    var body: some View {
        Text("B View \(store.name)")
        
        Button("Change"){
            store.name = "Hello from B"
        }
    }
}

// animations

struct RotationView: View {
    @State var rotation: Double = 0.0
    
    var body: some View {
        VStack {
            Text("Rotate me")
                .font(.largeTitle)
                .bold()
                .rotationEffect(.degrees(rotation))
            
            Button("Rotate"){
                withAnimation(.bouncy) {
                    rotation == 360 ? (rotation = 0) : (rotation = 360)
                }
            }
        }
    }
}


#Preview {
    RotationView()
}
