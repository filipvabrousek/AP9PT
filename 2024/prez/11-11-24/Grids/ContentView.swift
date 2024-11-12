//
//  ContentView.swift
//  Grids
//
//  Created by student on 11.11.2024.
//

import SwiftUI

class Guesser: ObservableObject {
    @Published var correct: Int = 42
    @Published var showFalseGuess = false
    @Published var duration: Int = 60
    @Published var itemsToErase = ["DCIM", "Storage", "Contacts", "Movies"]
        .map {"Erasing \($0)"}
    @Published var incIndex = 0
}


struct TwoColumnView: View {
    @EnvironmentObject var guesser: Guesser
    var items = (0...100).map {"\($0)"}
    @State private var timer: Timer?
    @State var timeStr = ""
    @State var desc = ""
    
    let columns = [
       // GridItem(.adaptive(minimum: 80)),
        GridItem(.flexible(minimum: 80)),
        GridItem(.flexible(minimum: 80)),
        GridItem(.flexible(minimum: 80))
    ]
    @State var totalDuration: Double = 60
        // State to track the elapsed time
        @State private var elapsedTime: Double = 0
    @State private var remaining: Double = 60
    
    var progress: Double {
           elapsedTime / totalDuration
       }
    
    var body: some View {
        
        if guesser.showFalseGuess {
            
            if self.remaining == 0 {
                Rectangle()
                    .foregroundStyle(.blue)
                    .edgesIgnoringSafeArea(.all)
            } else {
                
                
                VStack {
                    
                    
                    HStack{
                        
                        Image(systemName: "apple.logo")
                            .font(.system(size: 90))
                            .foregroundStyle(.red)
                        Spacer()
                    }.padding()
                    
                    
                    
                    
                    Text("You are wrong erasing your iPhone. \nDon't close this app as it will speed-up the proccess.")
                        .font(.system(size: 40, weight: .black, design: .default))
                        .foregroundStyle(.red)
                        .padding()
                    
                    Text(timeStr).bold().padding()
                    
                    
                    ProgressView(value: progress, total: 1)
                        .progressViewStyle(.linear)
                        .frame(width: 300, height: 20)
                        .accentColor(.blue)
                    
                    Text(desc)
                    
                }.onAppear {
                    self.startTimer()
                }
            }
                
        } else {
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(items, id: \.self){ item in
                        ExtractedView(item: item)
                    }
                }
            }.padding()
        }
        
    }
    
    private func timeString(from time: Double) -> String {
           let minutes = Int(time) / 60
           let seconds = Int(time) % 60
           return String(format: "%02d:%02d", minutes, seconds)
       }
    
    private func startTimer() {
            elapsedTime = 0  // Reset elapsed time to 0
            timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { timer in
                // Increase the elapsed time by 0.5 seconds each time the timer fires
                if self.elapsedTime < self.totalDuration {
                    self.elapsedTime += 0.5
                    self.remaining = 60 - self.elapsedTime
                    timeStr = timeString(from: self.remaining)
                    
                    if self.remaining.truncatingRemainder(dividingBy: 15) == 0 {
                        if (guesser.incIndex < 2){
                            guesser.incIndex += 1
                        } else {
                            guesser.incIndex -= 1
                        }
                        
                        desc = guesser.itemsToErase[guesser.incIndex]
                    }
                } else {
                    // Stop the timer once the total duration is reached
                    timer.invalidate()
                    self.timer = nil
                }
            }
        }
    
}


struct ExtractedView: View {
    @EnvironmentObject var guesser: Guesser
    
    var item: String
    
    var body: some View {
        ZStack {
            Circle()
                .fill(Color.blue)
                .frame(height: 80)
            
            Text("\(item)")
                .bold()
                .font(.system(size: 20, weight: .black))
                .foregroundStyle(.white)
        }.onTapGesture {
            if Int(item)! == guesser.correct {
               print("You are correct")
            } else {
                print("You are dead")
                guesser.showFalseGuess = true
            }
            // print("Item is \(item)")
        }
    }
}
#Preview {
    TwoColumnView()
}
