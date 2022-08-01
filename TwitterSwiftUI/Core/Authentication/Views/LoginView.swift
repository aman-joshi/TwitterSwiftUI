//
//  LoginView.swift
//  TwitterSwiftUI
//
//  Created by Aman Joshi on 01/08/22.
//

import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    var body: some View {
        //parent container
        VStack {
            //header view
            headerView
            
            VStack(spacing:40) {
                CustomInputField(imageName: "envelope", placeholder: "Email", text: $email)
                
                CustomInputField(imageName: "lock", placeholder: "Password", text: $password)
            }.padding(.horizontal,32)
                .padding(.top,44)
            
            HStack {
                Spacer()
                NavigationLink {
                    Text("Reset Password")
                } label: {
                    Text("Forgot Password?")
                        .foregroundColor(Color(.systemBlue))
                        .font(.caption).bold()
                        .padding(.top)
                        .padding(.trailing,24)
                }
            }
            
            Button {
                print("Sign in here..")
            } label: {
                Text("Sign In")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(width:UIScreen.main.bounds.width - 32 ,height: 50)
                    .background(Color(.systemBlue))
                    .clipShape(Capsule())
                    .padding()
            }
            .shadow(color: .gray.opacity(0.5), radius: 10.0, x: 0, y: 1)
            
            Spacer()
            
            NavigationLink {
                RegistrationView()
                    .navigationBarHidden(true)
            } label: {
                HStack {
                    Text("Dont't have an account?").font(.footnote)
                    
                    Text("Sign Up").font(.footnote).fontWeight(.semibold)
                }
            }.foregroundColor(Color(.systemBlue))
            .padding(.bottom,32)
        }
        .ignoresSafeArea()
        .navigationBarHidden(true)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

extension LoginView {
    var headerView:some View {
        VStack(alignment:.leading) {
            HStack { Spacer() }
            Text("Hello.").font(.largeTitle).fontWeight(.semibold)
            Text("Welcome Back.").font(.largeTitle).fontWeight(.semibold)
        }
        .frame(height: 260)
        .padding(.leading)
        .background(Color(.systemBlue))
        .foregroundColor(.white)
        .clipShape(RoundedShape(corners: [.bottomRight], cornerRadii: CGSize(width: 80, height: 80)))
    }
}
