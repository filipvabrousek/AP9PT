import SwiftUI

@main struct MyApp: App {
    var body: some Scene {
        WindowGroup {
            CellView()
        }
    }
}




struct OwnView: View {
    var body: some View {
        Text("Our view")
    }
}

struct WrapView: View {
    var body: some View {
        VStack {
            Text("Top")
            Spacer()
            Text("Bottom")
        }
        
        HStack {
            Text("Left")
            Spacer()
            Text("Right")
        }
    }
}


struct ModView: View {
    var body: some View {
        
        VStack(alignment: .leading) {
            Text("Modify")
                .foregroundStyle(.green)
                .font(.system(size: 30,
                              weight: .heavy))
            
            Image("artemis-II")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 300,
                       height: 300,
                       alignment: .leading)
                .border(.green)
            
        }.border(.orange)
        
        // image, align
           
            
    }
}



struct CellView: View {
    var body: some View {
        HStack {
            Image("nasa")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50)
            
            VStack(alignment: .leading) {
                Text("NASA")
                Text("Artemis II")
            }.bold()
            
            Spacer()
            
            Button("..."){
                print("Hello")
            }
            
        }.padding([.leading, .trailing])
        
        Image("artemis-II")
            .resizable()
            .aspectRatio(contentMode: .fit)
            //.frame(width: 300)
        
        LikeView()
    }
}



struct LikeView: View {
    var body: some View {
        HStack {
            Button {
                
            } label: {
                Image(systemName: "heart.fill")
                    
            }//.labelsHidden()
            
            Button {
                
            } label: {
                Label("", systemImage: "sun.min.fill")
            }

            Spacer()
        }.padding()
            .font(.headline)
            .foregroundStyle(.black)
    }
}

#Preview {
    CellView()
}
