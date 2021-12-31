//
//  ContentView.swift
//  Hockeylitics
//
//  Created by Laurin Tarta on 28.12.21.
//

import SwiftUI

let LightGrayColor = Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0 )

let storedUsername = "Laurin"

let storedPassword = "abcabc"

struct ContentView: View {
    
   @State var username: String = ""
    @State var password: String = ""
    @State var authDidFail: Bool = false
    @State var authDidSuceed: Bool = false
    
    
    
    var body: some View {
        
        ZStack{
            VStack{
                HelloText()
                ImageUser()
                UsernameTextfield(username: $username)
                PasswordTextfield(password: $password)
                if authDidFail {
                    Text("Access Denied. Try Again")
                        .offset(y: -10)
                        .foregroundColor(.red)
                }
                
                Button(action:  { if self.username == storedUsername && self.password == storedPassword{ self.authDidSuceed = true
                    
                }
               else{
                   self.authDidFail = true
               }}
                ){
                    LoginButtonContent()
                }
               
                
            }
                       
            .padding()
            if authDidSuceed{
                Text("Access granted!")
                    .font(.headline)
                    .frame(width: 250, height: 45)
                    .background(.yellow)
                    .cornerRadius(20)
                    .foregroundColor(.white)
                    
            }
            
                 
        }
        }
        
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct HelloText: View {
    var body: some View {
        Text("Hello you!")
            .font(.largeTitle)
            .fontWeight(.semibold)
            .padding(.bottom, 20)
    }
}

struct ImageUser: View {
    var body: some View {
        Image("Image")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 150, height: 150)
            .clipped()
            .cornerRadius(150)
            .padding(.bottom, 75)
    }
}

struct LoginButtonContent: View {
    var body: some View {
        Text("Login")
            .font(.headline)
            .foregroundColor(.white)
            .padding()
            .frame(width: 220, height: 60)
            .background(.black)
            .cornerRadius(35)
    }
}

struct UsernameTextfield: View {
    
    @Binding var username : String

    
    var body: some View {
        TextField("Username", text:$username)
            .padding()
            .background(LightGrayColor)
            .cornerRadius(5.0)
            .padding(.bottom, 20)
    }
}

struct PasswordTextfield: View {
    
    @Binding var password : String
    
    var body: some View {
        SecureField("Password", text:$password)
            .padding()
            .background(LightGrayColor)
            .cornerRadius(5.0)
            .padding(.bottom, 20)
    }
}
