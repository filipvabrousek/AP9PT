//
//  SharingData_30_10_25_sk2App.swift
//  SharingData-30-10-25-sk2
//
//  Created by Filip Vabroušek on 30.10.2025.
//

import SwiftUI
import Combine

// Sharing data between views
class SharedData: ObservableObject {
    @Published var msg: String = ""
    @Published var remaining = 100 // 01:40
    @Published var timeString: String = ""
    @Published var amount: Double = 0
    
    var timer: Timer?

    init() {
        // Initialize timeString from the initial remaining value
        self.timeString = SharedData.formatTime(remaining)

        timer = Timer.scheduledTimer(withTimeInterval: 1.0,
                                     repeats: true,
                                     block: { [weak self] t in
            guard let self else { return }
            if self.remaining > 0 {
                self.remaining -= 1
            } else {
                // timer?.invalidate() stops the timer
            }
            // Update the string every tick (including when it reaches 0)
            self.timeString = SharedData.formatTime(self.remaining)
        })
    }

    static func formatTime(_ seconds: Int) -> String {
        let mins = seconds / 60
        let secs = seconds % 60
        return String(format: "%02d:%02d", mins, secs)
    }
}

//@main
struct SharingData_30_10_25_sk2App: App {
    var sharedData = SharedData()
    
    var body: some Scene {
        WindowGroup {
            TimerView()
            //WrapperView()
                .environmentObject(sharedData)
        }
    }
}

struct TimerView: View {
    @EnvironmentObject var shared: SharedData

    var body: some View {
        VStack {
            Slider(value: $shared.amount, in: 0...200)
                .onChange(of: shared.amount) { oldValue, newValue in
                shared.remaining = Int(newValue.rounded())
                shared.timeString = SharedData.formatTime(shared.remaining)
            }
            
            Text("Remaining: \(shared.timeString)")
                .font(.largeTitle)
        }
    }
}















struct WrapperView: View {
    @EnvironmentObject var shared: SharedData
    var body: some View {
        VStack(spacing: 20) {
            AView().border(Color.orange)
            BView().border(Color.orange)
            // Example of showing the timer string and remaining if desired
            
        }.font(.largeTitle)
    }
}

struct AView: View {
    @EnvironmentObject var shared: SharedData
    var body: some View {
        VStack(alignment: .leading) {
            Text("msg: \(shared.msg)")
            Button("Change from A"){
                shared.msg = "Shared from A"
            }
        }
    }
}

struct BView: View {
    @EnvironmentObject var shared: SharedData
    var body: some View {
        VStack(alignment: .leading) {
            Text("msg: \(shared.msg)")
            Button("Change from B"){
                shared.msg = "Shared from B"
            }
        }
    }
}
