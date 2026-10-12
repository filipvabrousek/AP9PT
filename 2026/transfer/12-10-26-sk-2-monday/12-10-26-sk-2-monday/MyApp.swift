import SwiftUI

@main struct MyApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

struct WrapperView: View {
    @State var counter = 0
    
    var body: some View {
        VStack(alignment: .leading){
            
            
            Text("Wrapper")
            Button("Increment \(counter)"){
                counter += 1
            }
            
            ReadView(boundValue: $counter)
            
        }.font(.largeTitle)
        
        }
}





#Preview {
    WrapperView()
}



struct ReadView: View {
    var boundValue: Binding<Int>
    
    var body: some View {
        Text("BoundValue is \(boundValue.wrappedValue)")
    }
}
