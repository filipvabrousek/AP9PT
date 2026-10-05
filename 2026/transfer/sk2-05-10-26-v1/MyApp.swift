import SwiftUI

@main struct MyApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

// 1 - Layout + styling revise
// 2 - State basics
// Guesser game - read code from Claude Code (share)

struct StyleRevise: View {
    var body: some View {
        VStack {
            Text("Layout")
                .font(.system(size: 60, weight: .heavy))
                .foregroundStyle(.orange)
                .border(.orange, width: 4)
                .padding()
                .border(.green, width: 4)
            
            Text("Right")
        }
        
        HStack {
            Text("Left")
            Spacer()
            Text("Right")
        }.font(.system(size: 70))
        
        
       
        
        
    }
}

#Preview {
    StyleRevise()
}
