import SwiftUI

@main
struct MyApp: App {
    var body: some Scene {
        WindowGroup {
           WrapView()
        }
    }
}


struct WrapView: View {
    @State var count = 0
    
    var body: some View {
        VStack {
            Button("Change data count: \(count)"){
                count += 1
            }
            
            BoundView(local: $count)
        }.font(.largeTitle)
    }
}




struct BoundView:View {
    var local: Binding<Int>
    var body: some View {
        Text("Bound value is \(local.wrappedValue)")
    }
}

#Preview {
    WrapView()
}
