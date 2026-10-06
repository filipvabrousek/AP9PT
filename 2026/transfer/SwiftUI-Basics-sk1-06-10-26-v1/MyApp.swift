import SwiftUI

@main
struct MyApp: App {
    var body: some Scene {
        WindowGroup {
         NamedView(name: "Eda")
        }
    }
}

struct MyView: View {
    var body: some View {
        Text("Hello")
    }
}

struct NamedView: View {
    var name: String
    var body: some View {
        Text("Hello \(name)")
    }
}
//  NamedView(name: "Eda")



struct StyledView: View {
    var body: some View {
        Text("Hello")
            .foregroundStyle(.orange)
            .font(.largeTitle)
            .foregroundStyle(.green)
    }
}


struct LayoutBasics: View {
    var body: some View {
        HStack {
            Text("Top")
            Text("Bottom")
        }
    }
}


struct ImageView: View {
    var body: some View {
        Image(systemName: "figure.pool.swim.circle.fill")
            .font(.largeTitle)
    }
}



#Preview {
    ImageView()
}
