//
//  AuthenticationHeaderView.swift
//  TwitterSwiftUI
//
//  Created by Aman Joshi on 02/08/22.
//

import SwiftUI

struct AuthHeaderView: View {
    let title:String
    let subTitle:String
    var body: some View {
        VStack(alignment:.leading) {
            HStack { Spacer() }
            Text(title).font(.largeTitle).fontWeight(.semibold)
            Text(subTitle).font(.largeTitle).fontWeight(.semibold)
        }
        .frame(height: 260)
        .padding(.leading)
        .background(Color(.systemBlue))
        .foregroundColor(.white)
        .clipShape(RoundedShape(corners: [.bottomRight], cornerRadii: CGSize(width: 80, height: 80)))
    }
}

struct AuthHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        AuthHeaderView(title: "Get Started.", subTitle: "Create your account.")
    }
}
