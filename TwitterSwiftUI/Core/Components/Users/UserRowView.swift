//
//  UserRowView.swift
//  TwitterSwiftUI
//
//  Created by Apple on 29/07/22.
//

import SwiftUI

struct UserRowView: View {
    var body: some View {
        HStack(spacing:8) {
            Circle().frame(width: 48, height: 48)
            
            VStack(alignment:.leading,spacing: 4) {
                Text("Joker")
                    .font(.subheadline).bold()
                    .foregroundColor(.black)
                Text("Batman")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            Spacer()
        }.padding(.horizontal)
            .padding(.vertical,4)
    }
}

struct UserRowView_Previews: PreviewProvider {
    static var previews: some View {
        UserRowView()
    }
}
