import SwiftUI

@main
struct MyApp: App {
    var body: some Scene {
        WindowGroup {
            // MyView()
            // CallView(name: "Eda")
           //  IMView()
            /*ScrollView {
                InstaCell()
                InstaCell()
                InstaCell()
            }*/
            
            StateView()
        }
    }
}

struct MyView: View {
    var body: some View {
        HStack {
            Text("Hello, I am **View**")
                .foregroundStyle(.green)
                .font(.system(size: 40))
                .italic()
            
            Text("Cool")
                .font(.system(size: 40))
        }
    }
}


struct CallView: View {
    var name: String
    
    var body: some View {
        Text("I am \(name)")
    }
}



struct IMView: View {
    var body: some View {
        //Image(systemName: "apple.terminal")
          //  .font(.largeTitle)
        
        Image("orion_transfer")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .grayscale(0.8)
    }
}

// Insta


struct InstaCell: View {
    var body: some View {
        
        VStack {
            HStack(spacing: 3) {
                Image("orion_transfer")
                    .resizable()
                    .frame(width: 50,
                           height: 50)
                    .aspectRatio(contentMode: .fit)
                    .clipShape(.circle)
                    
                    .border(.green)
                   // .padding()
                    //.border(Color.orange.gradient)
                
                VStack(alignment: .leading) {
                    Text("NASA").bold()
                    Text("Kennedy space center")
                }

                Spacer().border(.blue)
                   // .border(.orange,
                          //  width: 3)
                    
                
            }
            
            
            Image("orion_transfer")
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            HStack {
                Button {
                    print("Liked")
                } label: {
                    Image(systemName: "heart.fill")
                }
                
                Button {
                    print("Liked")
                } label: {
                    Image(systemName: "heart.fill")
                }
                
                Button {
                    print("Liked")
                } label: {
                    Image(systemName: "heart.fill")
                }
                
                
                Spacer()
            }
               
        }
    }
}



// + State + Agents game






#Preview {
    
    ScrollView {
        InstaCell()
        InstaCell()
        InstaCell()
    }
   
   // CallView(name: "Eda")
}





// State

struct StateView: View {
    @State var counter = 0
    
    var body: some View {
        Button("Increase counter: \(counter)") {
            counter += 1
        }
        
        if counter > 3 {
            Text("Larger than 3")
        }
        
        
        HStack {
            
            
            ForEach(0..<3){_ in
                Circle()
                    .foregroundStyle(.orange)
                    .frame(width: 30, height: 30)
            }
        }
        
    }
}





