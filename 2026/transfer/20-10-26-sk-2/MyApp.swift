import SwiftUI

@main
struct MyApp: App {
    var body: some Scene {
        WindowGroup {
           RootView()
        }
    }
}

@Observable
class Repo {
    var counter = 0
    var isShown = false
    
    var description: String {
        if counter > 2 {
            return "bigger than 2"
        } else if counter > 1 {
            return "bigger than 1"
        } else {
            return "Less than one"
        }
    }
    
    // API request
}

struct RootView: View {
    @State var repo = Repo()
    
    var body: some View {
        ChildView().environment(repo)
    }
}


struct ChildView: View {
    @Environment(Repo.self) var repo
    
    var body: some View {
        @Bindable var rp = repo
        
        
        VStack {
            
            
            Button("Increase counter \(repo.counter)"){
                repo.counter += 1
                // show sheet of counter > 3
                
                if repo.counter > 3 {
                    rp.isShown.toggle()
                }
                
            }.sheet(isPresented: $rp.isShown) {
                Text("Sheet")
            }
            
            
            Button("decrease counter"){
                repo.counter -= 1
            }
            
            
            Text("Description \(repo.description)")
        }.font(.largeTitle)
    }
}

struct SiblingView: View {
    @Environment(Repo.self) var repo
    
    var body: some View {
        Text("Shared data: \(repo.counter)")
    }
}

