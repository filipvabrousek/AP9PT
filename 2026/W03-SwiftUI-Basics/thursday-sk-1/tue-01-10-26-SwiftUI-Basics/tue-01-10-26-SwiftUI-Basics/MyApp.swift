import SwiftUI


enum MyColor {
        case green
        case red
}

let light: MyColor = .red



@main
struct MyApp: App {
    var body: some Scene {
        WindowGroup {
            StateTest()
           // InstaCell()
           // MyView()
           // OtherView(name: "Eda")
            // State basics
        }
    }
}




struct MyView: View {
    var body: some View {
        // CMD + S, CMD + R
        Text("Hello")
            .bold() // modifiers
            .foregroundStyle(.orange)
        
        HStack {
            Text("Left")
            Spacer()
            Text("Right")
        }.border(Color.orange)
        
        
        VStack {
            Text("Top")
            Spacer()
            Text("Bottom")
        }.border(Color.green)
    }
}



struct OtherView: View {
    
    var name: String
    
    var attr: AttributedString {
        return AttributedString("Hello **A**")
    }
    
    var body: some View {
        Text(attr)
            .font(.system(size: 30))
            .italic()
    }
}

// Insta Cell

struct InstaCell: View {
    var body: some View {
        VStack {
            HStack {
                Image("nasa")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 80).clipShape(.circle)
            // leading left
            // trailing right
            VStack(alignment: .leading) {
                    Text("NASA")
                        .bold()
                    Text("Kennedy Space Center")
                }
                
                Spacer()
                
                Button("..."){
                    
                }
                
            } // HStack
            
            
            
            Image("artemis-II")
                .resizable()
                .aspectRatio(contentMode: .fit)
            
           
            
            HStack {
                Button {
                    print("like")
                } label: {
                    Image(systemName: "heart.fill")
                }
                
                Button {
                    print("like")
                } label: {
                    Image(systemName: "heart.fill")
                }
                
                Button {
                    print("like")
                } label: {
                    Image(systemName: "rectangle.portrait.and.arrow.forward")
                }
                
                Spacer()
            }
            
            Spacer()
            
        } // VStack
    }
}

// State


 

struct StateTest: View {
    @State var count: Int = 0
    
    var body: some View {
        Button("Counter is \(count)"){
            count += 1
        }.foregroundStyle(count > 3 ? .green : .orange)
        
        if count >= 3 {
            Circle()
                .foregroundStyle(.green)
                .frame(width: 30, height: 30)
        }
        
        Button("Reset"){
            count = 0
        }
        
        // after >= 3 change to color green else orange
        // show circle
        
        
    }
}
