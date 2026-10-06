import SwiftUI

@main
struct MyApp: App {
    var body: some Scene {
        WindowGroup {
           MyView()
        }
    }
}

// CMD + S, CMD + R

struct MyView: View {
    var body: some View {
        Text("Hello")
    }
}

struct MyViewReuse: View {
    var name: String
    var body: some View {
        Text("Hello \(name)")
            .foregroundStyle(.orange)
            //.font(.headline)
            .font(.system(size: 60))
            .border(Color.green, width: 3)
            .padding()
            .border(Color.orange, width: 3)
    }
}
//  MyViewReuse(name: "Eda")

struct Multi: View {
    var body: some View {
        HStack {
            Text("Top")
            Text("Bottom")
            
            VStack {
                Text("Top")
                Text("Bottom")
            }.border(Color.orange)
        }.border(Color.purple)
        }
}


struct ImageView: View {
    var body: some View {
           // Image(systemName: "car.side")
           // .font(.largeTitle)
    
        Image(.sls2026)
            .resizable()
            .aspectRatio(contentMode: .fit)
    }
}








// Insta Cell + State

#Preview {
   ImageView()
}





