//
//  ContentView.swift
//  Game-18-11-24-sk-1
//
//  Created by student on 18.11.2024.
//

import SwiftUI

class Guesser: ObservableObject {
    @Published var correct: Int = 42
    @Published var showFalseGuess = false
    @Published var totalDuration: Double = 60
    @Published var remaining: Double = 60
    @Published var elapsedTime: Double = 0
    
    func getProgress() -> Double {
           (totalDuration - remaining) / totalDuration
    }
    
    @Published var itemsToErase = ["DCIM", "Storage", "Contacts", "Movies"]
        .map {"Erasing \($0)"}
    @Published var incIndex = 0
}



struct ThreeColumnView: View {
    @EnvironmentObject var guesser: Guesser
    @State private var timer: Timer?
    
  
    
    let columns = [
        GridItem(.flexible(minimum: 80)),
        GridItem(.flexible(minimum: 80)),
        GridItem(.flexible(minimum: 80))
        // GridItem(.adaptive(minimum: 20))
    ]
    
    let items = (0...1000).map {"\($0)"}
    
    var body: some View {
        
        
        if guesser.showFalseGuess {
            WrongView()
        } else {
            ScrollView {
                LazyVGrid(columns: columns){
                    ForEach(items, id: \.self){ it in
                        ExtractedView(it: it)
                    }
                }
            }
        }
        
        
        
     
    }
}


struct WrongView: View {
    @EnvironmentObject var guesser: Guesser
    
    @State var timeStr = "--:--"
    @State var timer: Timer?
    @State var progress = 0.0
   @State var desc = ""

    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "apple.logo")
                    .font(.system(size: 90))
                    .foregroundStyle(.red)
                Spacer()
            }.padding()
            
            Text("You are wrong. Erasing your iPhone.\n Don't close this app as it will speed-up the process.")
                .font(.system(size: 40, weight: .black, design: .default))
                .padding()
            
            Text(timeStr)
                .font(.system(size: 30))
            
            ProgressView(value: progress, total: 1)
                .progressViewStyle(.linear)
                .frame(width: 300, height: 20)
                .tint(.blue)
            
            Text(desc)
            
        }.onAppear {
          
            
            Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { timer in
                if guesser.remaining > 0 {
                    guesser.remaining -= 0.5
                    timeStr = secondsToMMSS(seconds: Int(guesser.remaining))
                    progress = guesser.getProgress()
                    
                    if guesser.remaining.truncatingRemainder(dividingBy: 15) == 0 {
                        if guesser.incIndex < 2 {
                            guesser.incIndex += 1
                        } else {
                            guesser.incIndex -= 1
                        }
                    }
                    
                    desc = guesser.itemsToErase[guesser.incIndex]
                    
                } else {
                    timer.invalidate()
                    self.timer = nil
                }
            }
            
        }
    }
    
    func secondsToMMSS(seconds: Int) -> String {
        let minutes = seconds / 60
        let remainingSeconds = seconds % 60
        return String(format: "%02d:%02d", minutes, remainingSeconds)
    }

    
}


struct ExtractedView: View {
    @EnvironmentObject var guesser: Guesser
    var it: String
    
    var body: some View {
        ZStack {
            Circle().foregroundStyle(.green)
            Text(it)
                .font(.system(size: 40,weight: .heavy))
                .foregroundStyle(.white)
        }.onTapGesture {
            if (Int(it)! == guesser.correct){
                print("You are correct.")
            } else {
                print("You are dead.")
                guesser.showFalseGuess = true
            }
        }
    }
}

#Preview {
    ThreeColumnView()
}
