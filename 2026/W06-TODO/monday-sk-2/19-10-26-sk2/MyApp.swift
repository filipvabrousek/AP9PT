import SwiftUI

@main
struct MyApp: App {
    var body: some Scene {
        WindowGroup {
            Root()
            //BMIView()
        }
    }
}

struct BMIView: View {
    @State var height = 0.0
    @State var weight = 0.0
    
    var bmi: Double {
        weight / (height * height)
    }
    
    var body: some View {
        Text("Height \(height)")
        Slider(value: $height,
               in: 0...2.5,
               step: 0.01)
    
        Text("Weight \(weight)")
        Slider(value: $weight,
               in: 0...200,
               step: 1.0)
        
        Text("Result")
        Text("Your BMI is \(bmi)")
        
        
    }
}

#Preview {
    BMIView()
}
