import SwiftUI

@main
struct MyApp: App {
    var body: some Scene {
        WindowGroup {
            CellView()
        }
    }
}

struct StyledView: View {
    var body: some View {
        
        VStack(alignment: .leading) {
            Text("Styled")
            .foregroundStyle(.orange)
           // .font(.system(size: 31))
            .font(.system(size: 31,
                          weight: .black,
                          design: .rounded))
            .opacity(0.6)
            
            Text("Centered")
                .font(.largeTitle)
            
            Image("Artemis-II")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .grayscale(0.8)
            
            
        }.border(.cyan)
        
        
            
        
        
        
        
    }
}






struct ExtractedWrapper: View {
    var body: some View {
        Extracted()
        MyView()
    }
}

struct MyView: View {
    var body: some View {
        Text("My view")
    }
}

struct Extracted: View {
    var body: some View {
        HStack {
            Text("Left")
            
            Text("Right")
        }
       
        VStack {
            Text("Top")
            Spacer()
            Text("Bottom")
        }
    }
}







struct CellView: View {
    var body: some View {
        
        
        HStack {
            Image("Artemis-II")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50)
                .clipShape(.circle)
                .padding(.trailing)
                
                //.border(.orange)
                
            
            
            Text("NASA")
                .bold()
            
            Spacer()
            
            Button("..."){
                print("Hello")
            }.font(.system(.headline, weight: .black))
            
        }.padding(.horizontal)
        
        // Text("Live, so 2019")
        Image("Artemis-II")
            .resizable()
            .aspectRatio(contentMode: .fit)
    }
}

#Preview {
    CellView()
}


