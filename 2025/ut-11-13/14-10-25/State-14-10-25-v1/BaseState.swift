//
//  BaseState.swift
//  State-14-10-25-v1
//
//  Created by Filip Vabroušek on 14.10.2025.
//
import SwiftUI

struct StateView: View {
    @State var counter = 0
    
    var body: some View {
        
        Text("Also reads counter \(counter)")
            .font(.largeTitle)
        
        Button("Count: \(counter)"){
            print("Clicked")
            counter += 1
        }.font(.largeTitle)
        
        Text("Will be green when counter is > 3")
            .foregroundStyle(counter > 3 ? .green : .black)
            .font(.largeTitle)
        
        if counter > 3 {
            Text("You have reached the limit")
                .foregroundStyle(.orange)
                .bold()
        }
    }
}



struct NewView: View {
    @State var count = 0
    
    var body: some View {
        Text("I will be green on even clicks and orange on odd clicks")
            .foregroundStyle(count % 2 == 0 ? .green : .orange)
            .font(.title)
            .bold()
        
        Button("Clicks"){
            count += 1
            
            for i in 0..<count {
                print(i)
            }
        }
    }
}

struct TwoWay: View {
    @State var text = ""
    
    var body: some View {
        ScrollView {
            
            
            VStack(alignment: .leading) {
                TextField("Hello", text: $text)
                
                
                Text(text)
                    .foregroundStyle(.orange)
                    .font(.largeTitle)
                    .rotationEffect(.degrees(text.count % 2 == 0 ? 30 : -30))
                
                Text(text)
                    .foregroundStyle(.green)
                    .font(.largeTitle)
                    .rotationEffect(.degrees(60))
                
                Text(text)
                    .foregroundStyle(.blue)
                    .font(.largeTitle)
                    .rotationEffect(.degrees(80))
                
            }
        }
    }
}





struct LoginView: View {
    @State var password: String = ""
    @State var username: String = ""
    @State var showFailure = false
    @State var showSuccess = false
    
    var body: some View {
        VStack {
            Text("Log-in")
           
            Fields(
                password: $password,
                username: $username
            )
            
            Rest(
                password: $password,
                username: $username
            )
        }
    }
}


struct Fields: View {
    var password: Binding<String>
    var username: Binding<String>
    
    var body: some View {
        TextField("Username", text: username)
            .textInputAutocapitalization(.never)
        
        SecureField("Password", text: password)
            .textInputAutocapitalization(.never)
    }
}



struct Rest: View {
    var password: Binding<String>
    var username: Binding<String>
    
    @State var showFailure = false
    @State var showSuccess = false
    
    var body: some View {
        Button("Log in"){
            if username.wrappedValue == "admin" && password.wrappedValue == "password" {
                self.showSuccess = true
                self.showFailure = false
            } else {
                self.showFailure = true
                self.showSuccess = false
            }
        }
        
        if showSuccess {
            Text("OK").bold().font(.largeTitle)
        }
        
        if showFailure {
            Text("WRONG").bold().font(.largeTitle)
        }
    }
}



#Preview {
    StateView()
}
