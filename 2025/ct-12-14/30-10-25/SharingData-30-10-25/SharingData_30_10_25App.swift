//
//  SharingData_30_10_25App.swift
//  SharingData-30-10-25
//
//  Created by Filip Vabroušek on 30.10.2025.
//

import SwiftUI

// IMPORTANT
import Combine

// STEP 1 - Data Store of shared data
class Store: ObservableObject {
    @Published var text: String = "Hello, World!"
    @Published var remaining = 100
    @Published var timeString: String = ""
    // @State was changed to @Published
    @Published var timeValue: Double = 100.0
    var timer: Timer?
    
    init() {
        // Initialize the formatted string based on initial remaining value
        self.timeString = Self.format(seconds: remaining)
        
        // Repeat timer every second (1.0, repeats: true)
        // block - do operations every second
        // We subtract time and adjust timestring
        timer = Timer.scheduledTimer(
            withTimeInterval: 1.0,
            repeats: true,
            block: { [weak self] t in
                // exit if there is no reference to this object
                
                guard let self = self else { return }
                if self.remaining > 0 {
                    self.remaining -= 1
                } else {
                    //t.invalidate() STOPS THE TIMER
                }
                self.timeString = Self.format(seconds: self.remaining)
                print("Remaining: \(self.remaining) | \(self.timeString)")
            }
        )
    }
    
    // make mm:ss from seconds
     static func format(seconds: Int) -> String {
        let minutes = seconds / 60
        let secs = seconds % 60
        return String(format: "%02d:%02d", minutes, secs)
    }
}

// STEP 2 - Make instance inside App struct, and add WrapperView inside
@main
struct SharingData_30_10_25App: App {
    let store = Store()
    
    var body: some Scene {
        WindowGroup {
           WrapperView()
                .environmentObject(store)
        }
    }
}

// STEP 3 - Make Wrapper View with reference to Store
struct WrapperView: View {
    @EnvironmentObject var store: Store
    //@State var timeValue: Double = 100.0
    
    var body: some View {
        VStack(spacing: 80) {
            // Still works if uncommented
           /* AView()
                .padding()
                .border(Color.orange)
           
            BView()
                .padding()
                .border(Color.orange) */
            // Slider to set time
            
            // Example display of the formatted countdown
            VStack {
                Text("Countdown")
                    .bold()
                
                Slider(value: $store.timeValue, in: 1...200)
                    .onChange(of: store.timeValue) { oldValue, newValue in
                    
                        store.remaining = Int(newValue.rounded())
                        store.timeString = Store.format(seconds: store.remaining)
                    }
                Text("\(Int(store.timeValue))")
                Text(store.timeString)
            }
            .font(.largeTitle)
        }
    }
}

// STEP 4
struct AView: View {
    @EnvironmentObject var store: Store
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("View A").bold()
            Text(store.text)
            Text("Time: \(store.timeString)")
            
            Button("Change Text") {
                store.text = "New Text from A"
            }
        }.font(.largeTitle)
    }
}

struct BView: View {
    @EnvironmentObject var store: Store
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("View B").bold()
            Text(store.text)
            Text("Time: \(store.timeString)")
            
            Button("Change Text") {
                store.text = "New Text from B"
            }
        }.font(.largeTitle)
    }
}


#Preview {
    WrapperView()
        .environmentObject(Store())
}
