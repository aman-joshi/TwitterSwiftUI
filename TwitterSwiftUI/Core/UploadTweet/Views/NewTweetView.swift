//
//  NewTweetView.swift
//  TwitterSwiftUI
//
//  Created by Aman Joshi on 31/07/22.
//

import SwiftUI
import Kingfisher

struct NewTweetView: View {
    @State private var caption:String = ""
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var authViewModel:AuthViewModel
    @ObservedObject var viewModel = UploadTweetViewModel()
    
    var body: some View {
        VStack {
            HStack {
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Text("Cancel").foregroundColor(Color(.systemBlue))
                }
                Spacer()
                
                Button {
                    viewModel.uploadTweet(withCaption: caption)
                } label: {
                    Text("Tweet")
                        .bold()
                        .padding(.horizontal)
                        .padding(.vertical,8)
                        .background(Color(.systemBlue))
                        .foregroundColor(.white)
                        .clipShape(Capsule())
                }
            }.padding()
            
            HStack(alignment:.top) {
                if let user = authViewModel.currentUser {
                    KFImage(URL(string: user.profileImageUrl))
                        .resizable()
                        .scaledToFill()
                        .clipShape(Circle())
                        .frame(width: 64, height: 64)
                    TextArea("What's happening?", text: $caption)
                }
                
            }.padding()
        }.onReceive(viewModel.$isUploaded) { success in
            if success {
                presentationMode.wrappedValue.dismiss()
            }
        }
    }
}

