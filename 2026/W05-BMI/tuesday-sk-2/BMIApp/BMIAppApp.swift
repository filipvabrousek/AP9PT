import SwiftUI

@main
struct BMIAppApp: App {
    var body: some Scene {
        WindowGroup {
          // Claude app  ContentView()
          OurApp()
        }
    }
}

struct OurApp: View {
    @State var weight = 0.0
    @State var height = 0.0
    // BMI = weight / height ^ 2
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("BMI")
            
            Text("Weight")
            Slider(value: $weight, in: 0...120, step: 1.0)
            
            Text("Height")
            Slider(value: $height, in: 1...2, step: 0.01)
            
            Text("BMI is \(weight / (height * height))")
        }.font(.largeTitle)
    }
}


struct AlertView: View {
    @State var show = false
    
    var body: some View {
        Button("Alert view"){
            // text.count == 0
            show.toggle()
        }.alert("My dialog", isPresented: $show){
            Button("OK") {
                
            }
        }
    }
}


struct TextFieldTest: View {
    @State var text = ""
    
    var body: some View {
        Group {
            TextField("Hello", text: $text)
            Text(text)
        }.font(.largeTitle)
    }
}


#Preview {
    TextFieldTest()
}

#Preview {
    OurApp()
}


// TextField
// Alert
