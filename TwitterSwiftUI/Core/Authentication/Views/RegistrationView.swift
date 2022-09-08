//
//  RegistrationView.swift
//  TwitterSwiftUI
//
//  Created by Aman Joshi on 01/08/22.
//

import SwiftUI

struct RegistrationView: View {
    
    @State private var email:String = ""
    @State private var username:String = ""
    @State private var fullname:String = ""
    @State private var password:String = ""
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var viewModel:AuthViewModel

    var body: some View {
        VStack {
            AuthHeaderView(title: "Get Started.", subTitle: "Create your account.")
            
            VStack(spacing:40) {
                CustomInputField(imageName: "envelope", placeholder: "Email", text: $email)
                CustomInputField(imageName: "person", placeholder: "Username", text: $username)
                CustomInputField(imageName: "person", placeholder: "Full name", text: $fullname)
                CustomInputField(imageName: "lock", placeholder: "Password", isSecureField:true, text: $password)
            }.padding(.horizontal,32)
                .padding(.top,44)
            
            Button {
                print("Sign up here..")
                viewModel.register(withEmail: email, password: password, fullname: fullname, username: username)
            } label: {
                Text("Sign Up")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(width:UIScreen.main.bounds.width - 32 ,height: 50)
                    .background(Color(.systemBlue))
                    .clipShape(Capsule())
                    .padding()
            }
            .shadow(color: .gray.opacity(0.5), radius: 10.0, x: 0, y: 1)
            
            Spacer()
            
            Button {
                presentationMode.wrappedValue.dismiss()
            } label: {
                HStack {
                    Text("Already have an account?").font(.footnote)
                    
                    Text("Sign In").font(.footnote).fontWeight(.semibold)
                }
            }.padding(.bottom,32)

            
        }.ignoresSafeArea()
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}

