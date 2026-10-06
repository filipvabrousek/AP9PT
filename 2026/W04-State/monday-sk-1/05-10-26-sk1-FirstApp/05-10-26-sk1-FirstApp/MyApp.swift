import SwiftUI

@main
struct MyApp: App {
    var body: some Scene {
        WindowGroup {
            InstaCell()
            // WrapperView()
        }
    }
}

// CMD + S, CMD + R

struct MyView: View {
    var body: some View {
        Text("Piece of my UI")
    }
}


struct NamedView: View {
    var name: String
    var body: some View {
        Text("Hello \(name)")
    }
}

struct WrapperView: View {
    var body: some View {
        HStack {
            Text("Top view")
            NamedView(name: "Eda")
        }
    }
}


struct TopView: View {
    var body: some View {
        VStack {
            Text("Longeeer")
            Text("Short")
        }
    }
}


struct ImageView: View {
    var body: some View {
        Image("orion")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .grayscale(0.7)
    }
}


// InstaCell

// State basics
#Preview {
    ImageView()
}
