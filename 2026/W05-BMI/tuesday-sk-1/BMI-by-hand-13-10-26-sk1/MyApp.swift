import SwiftUI

@main
struct MyApp: App {
    var body: some Scene {
        WindowGroup {
            AlertView()
        }
    }
}

struct BMIView: View {
    @State var weight = 0.0 // kg
    @State var height = 0.0 // m
    
    var bmi: Double {
        weight / (height * height)
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            // sliders
            Text("Height")
            Slider(value: $height, in: 0.1...2, step: 0.1)
            
            Text("Weight")
            Slider(value: $weight, in: 30...100, step: 1)
            
            if !bmi.isNaN {
                Text("BMI is \(Int(bmi))")
            }
            
        }
    }
}

// TextField version


struct AlertView: View {
    @State var showAlert = false
    
    var body: some View {
        Button("Show alert"){
            showAlert.toggle()
        }.alert("Something went wrong", isPresented: $showAlert){
            Button("OK"){
                
            }
        }
    }
}
