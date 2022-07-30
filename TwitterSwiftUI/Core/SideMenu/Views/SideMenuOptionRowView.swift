//
//  SideMenuOptionRowView.swift
//  TwitterSwiftUI
//
//  Created by Aman Joshi on 30/07/22.
//

import SwiftUI

struct SideMenuOptionRowView: View {
    
    var viewModel:SideMenuViewModel
    
    var body: some View {
        HStack(spacing:16) {
            Image(systemName: viewModel.imageName)
                .font(.headline)
                .foregroundColor(.gray)
            Text(viewModel.title)
                .font(.subheadline)
                .foregroundColor(.black)
            
            Spacer()
        }
        .padding(.vertical)
        .padding(.leading)
    }
}

struct SideMenuOptionRowView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuOptionRowView(viewModel: .profile)
    }
}
