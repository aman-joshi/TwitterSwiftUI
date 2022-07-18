//
//  TweetRowView.swift
//  TwitterSwiftUI
//
//  Created by Apple on 04/07/22.
//

import SwiftUI

struct TweetRowView: View {
    var body: some View {
        VStack(alignment:.leading) {
            HStack(alignment: .top, spacing: 12) {
                Circle().frame(width: 56, height: 56).foregroundColor(.blue)
                //user info & tweet caption
                VStack(alignment:.leading,spacing: 4){
                    //user info
                    HStack {
                        Text("Ragnar Lothbrok").font(.subheadline).bold()
                        Text("@ragnar").foregroundColor(.gray).font(.caption)
                        Text("2w").foregroundColor(.gray).font(.caption)
                    }
                    
                   //tweet caption
                    
                    Text("I'm from netherlands")
                        .font(.subheadline)
                        .multilineTextAlignment(.leading)
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

struct TweetRowView_Previews: PreviewProvider {
    static var previews: some View {
        TweetRowView()
    }
}
