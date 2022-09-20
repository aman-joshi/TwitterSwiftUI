//
//  TweetRowView.swift
//  TwitterSwiftUI
//
//  Created by Apple on 04/07/22.
//

import SwiftUI
import Kingfisher

struct TweetRowView: View {
    
    let tweet:Tweet
    
    var body: some View {
        VStack(alignment:.leading) {
            HStack(alignment: .top, spacing: 12) {
                if let user = tweet.user {
                    KFImage(URL(string: user.profileImageUrl))
                        .resizable()
                        .scaledToFill()
                        .clipShape(Circle())
                        .frame(width: 56, height: 56)
                    //user info & tweet caption
                    VStack(alignment:.leading,spacing: 4){
                        //user info
                        HStack {
                            Text(user.fullname).font(.subheadline).bold()
                            Text("@\(user.username)").foregroundColor(.gray).font(.caption)
                            Text("2w").foregroundColor(.gray).font(.caption)
                        }
                        
                        //tweet caption
                        
                        Text(tweet.caption)
                            .font(.subheadline)
                            .multilineTextAlignment(.leading)
                    }
                }
            }
            //action buttons
            
            HStack {
                Button {
                    //action goes here
                } label: {
                    Image(systemName: "bubble.left")
                        .font(.subheadline)
                }
                
                Spacer()
                
                Button {
                    //action goes here
                } label: {
                    Image(systemName: "arrow.2.squarepath")
                        .font(.subheadline)
                }
                
                Spacer()
                
                Button {
                    //action goes here
                } label: {
                    Image(systemName: "heart")
                        .font(.subheadline)
                }
                
                Spacer()
                
                Button {
                    //action goes here
                } label: {
                    Image(systemName: "bookmark")
                        .font(.subheadline)
                }
            }
            .padding()
            .foregroundColor(.gray)
            Divider()
        }
    }
}

