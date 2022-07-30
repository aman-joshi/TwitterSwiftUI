//
//  UserStatsView.swift
//  TwitterSwiftUI
//
//  Created by Apple on 29/07/22.
//

import SwiftUI

struct UserStatsView: View {
    var body: some View {
        HStack(spacing:24){
            
            HStack(spacing:4) {
                Text("804")
                    .foregroundColor(.black)
                    .font(.subheadline).bold()
                Text("Following").font(.caption)
                    .foregroundColor(Color.gray)
            }
            
            HStack(spacing:4) {
                Text("3.8M")
                    .foregroundColor(.black)
                    .font(.subheadline).bold()
                Text("Followers").font(.caption)
                    .foregroundColor(Color.gray)
            }
        }
    }
}

struct UserStatsView_Previews: PreviewProvider {
    static var previews: some View {
        UserStatsView()
    }
}
