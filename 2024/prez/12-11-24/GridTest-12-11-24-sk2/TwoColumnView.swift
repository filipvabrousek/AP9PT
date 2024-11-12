//
//  TwoColumnView.swift
//  GridTest-12-11-24-sk2
//
//  Created by student on 12.11.2024.
//

import SwiftUI

class Guesser: ObservableObject {
    @Published var correct: Int = 42
    @Published var showFalseGuess: Bool = false
    @Published var duration: Double = 60
    
    @Published var itemsToErase = ["DCIM", "Storage", "Contacts", "Movies"].map {"Erasing \($0)"}
    
    
    @Published var incIndex = 0
    
    func timeString(from seconds: Int) -> String {
            let minutes = seconds / 60
            let seconds = seconds % 60
            return String(format: "%02d:%02d", minutes, seconds)
        }
}

struct TwoColumnView: View {
    @EnvironmentObject var guesser: Guesser
    
    var items = (0...10000).map {"\($0)"}
    
   
    
    let columns = [
        // increasing minimum number means we see fewer items
        //GridItem(.adaptive(minimum: 80)),
        
        // as many columns as flexible grid items
        GridItem(.flexible(minimum: 80)),
        GridItem(.flexible(minimum: 80)),
        GridItem(.flexible(minimum: 80))
    ]
    
    
    var body: some View {
        
        if guesser.showFalseGuess {
            WrongView()
        } else {
            ScrollView { // LazyHGrid nalso possible
                LazyVGrid(columns: columns){
                    ForEach(items, id: \.self){ item in
                        ExtractedView(item: item)
                    }
                }
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
                .font(.system(size: 20, weight: .black))
                .foregroundStyle(.white)
        }.onTapGesture {
            if Int(item)! == guesser.correct {
                print("You are correct")
            } else {
                print("You are dead")
                guesser.showFalseGuess = true
            }
        }
    }
}


struct WrongView: View {
    @EnvironmentObject var guesser: Guesser
    
    @State var elapsedTime: Double = 0
    @State var remaining: Double = 60
    @State var totalDuration: Double = 60
    @State var timeStr = ""
    @State var desc = ""
    
    @State var timer: Timer?
    
    var progress: Double {
        elapsedTime / guesser.duration
    }
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "apple.logo")
                    .font(.system(size: 90))
                    .foregroundStyle(.red)
                Spacer()
            }.padding()
            
            Text("You are wrong. Erasing your iPhone \n Don't close this app as it will speed up proccess.")
                .font(.system(size: 40, weight: .black))
                .foregroundStyle(.red)
                .padding()
            
            Text(timeStr)
                .font(.title)
            
            Text(desc)
            
        }.onAppear {
            self.startTimer()
        }
    }
    
    func startTimer() {
        elapsedTime = 0
        
        timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true, block: { timer in
            
            
            if self.elapsedTime < self.totalDuration {
                self.elapsedTime += 0.5
                self.remaining = 60 - self.elapsedTime
                
                
                timeStr = guesser.timeString(from: Int(self.remaining))
                
    if self.remaining.truncatingRemainder(dividingBy: 15) == 0 {
                    if (guesser.incIndex < 2){
                        guesser.incIndex += 1
                    } else {
                        guesser.incIndex -= 1
                    }
        
        desc = guesser.itemsToErase[guesser.incIndex]
                    
                }
                
            } else {
                timer.invalidate()
                self.timer = nil
            }
        })
    }
}
