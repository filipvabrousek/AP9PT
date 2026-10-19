import SwiftUI

@main struct MyApp: App {
    var body: some Scene {
        WindowGroup {
           WrapperView()
        }
    }
}

struct WrapperView: View {
    @State var count = 0
    
    var body: some View {
        Group {
            Button("Click me count: \(count)"){
                count += 1
            }
            
            HomeView(bound: $count)
            // next view
        }.font(.largeTitle)
    }
}

struct HomeView: View {
    var bound: Binding<Int>
    
    var body: some View {
        Text("Bound is \(bound.wrappedValue * 3)")
    }
}

#Preview {
    WrapperView()
}
