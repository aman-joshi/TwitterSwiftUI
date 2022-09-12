//
//  ProfilePhotoSelectorView.swift
//  TwitterSwiftUI
//
//  Created by Aman Joshi on 08/09/22.
//

import SwiftUI

struct ProfilePhotoSelectorView: View {
    @State private var showImagePicker = false
    @State private var selectedImage:UIImage?
    @State private var profileImage:Image?
    @EnvironmentObject var viewModel:AuthViewModel
    
    var body: some View {
        VStack {
            AuthHeaderView(title: "Create an account", subTitle: "Add a profile photo")
            
            Button {
                showImagePicker = true
            } label: {
                if let profileImage = profileImage {
                    profileImage
                        .resizable()
                        .modifier(ProfileImageModifier())
                }else {
                    Image(systemName: "plus.app.fill")
                        .resizable()
                        .renderingMode(.template)
                        .modifier(ProfileImageModifier())
                }
            }
            .sheet(isPresented: $showImagePicker,
                   onDismiss: loadImage) {
                ImagePicker(selectedImage: $selectedImage)
            }
            .padding(.top,44)
            
            if let selectedImage = selectedImage {
                Button {
                    viewModel.uploadProfileImage(image: selectedImage)
                } label: {
                    Text("Continue")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(width: 340, height: 40)
                        .background(Color(.systemBlue))
                        .clipShape(Capsule())
                        .padding()
                }
            }
            
            Spacer()
        }
        .ignoresSafeArea()
        
    }
    
    func loadImage() {
        guard let selectedImage = selectedImage else { return }
        profileImage = Image(uiImage: selectedImage)
    }
}

struct ProfileImageModifier:ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(Color(.systemBlue))
            .frame(width: 180, height: 180)
            .scaledToFill()
            .clipShape(Circle())
    }
    
}

