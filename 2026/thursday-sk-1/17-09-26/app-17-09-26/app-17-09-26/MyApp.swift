import SwiftUI

@main
struct MyApp: App {
    var body: some Scene {
        WindowGroup {
           MyView()
        }
    }
}

struct MyView: View {
    var body: some View {
        
        HStack {
            Text("Hello")
                 .font(.largeTitle)
                 .foregroundStyle(.green)
            
            Spacer()
            
            Text("Hello")
                 .font(.largeTitle)
                 .foregroundStyle(.green)
        }
        
        Image(systemName: "sun.min.fill")
            .font(.largeTitle)
        
        Image("sls")
            .resizable()
            .frame(width: 300, height: 300)
            //.grayscale(1)
        
        
        
    }
}
