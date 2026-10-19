import SwiftUI

@main struct MyApp: App {
    var body: some Scene {
        WindowGroup {
           MyView()
        }
    }
}



struct MyView: View {
    @State var test = 0

    var body: some View {
        VStack {
            Button("Hello"){
                test += 1
            }
            
            BoundView(boundTest: $test)
        }.font(.largeTitle)
    }
}


struct BoundView: View {
    var boundTest: Binding<Int>
    
    var body: some View {
        Text("The value is \(boundTest.wrappedValue)")
    }
}


#Preview {
    MyView()
}


