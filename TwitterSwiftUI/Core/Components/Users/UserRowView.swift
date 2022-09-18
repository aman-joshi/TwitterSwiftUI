//
//  UserRowView.swift
//  TwitterSwiftUI
//
//  Created by Apple on 29/07/22.
//

import SwiftUI
import Kingfisher

struct UserRowView: View {
    
    let user:User
    
    var body: some View {
        HStack(spacing:8) {
            KFImage(URL(string: user.profileImageUrl))
                .resizable()
                .scaledToFill()
                .clipShape(Circle())
                .frame(width: 48, height: 48)
            
            VStack(alignment:.leading,spacing: 4) {
                Text(user.username)
                    .font(.subheadline).bold()
                    .foregroundColor(.black)
                Text(user.fullname)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            Spacer()
        }.padding(.horizontal)
            .padding(.vertical,4)
    }
}
