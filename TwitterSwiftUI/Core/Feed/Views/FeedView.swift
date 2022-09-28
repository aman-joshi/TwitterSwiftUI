//
//  FeedView.swift
//  TwitterSwiftUI
//
//  Created by Apple on 04/07/22.
//

import SwiftUI

struct FeedView: View {
    @State private var showNewTweetView = false
    @ObservedObject var viewModel = FeedViewModel()
    
    var body: some View {
            ZStack(alignment:.bottomTrailing) {
                ScrollView {
                    LazyVStack {
                        ForEach(viewModel.tweets,id:\.id) { tweet in
                            TweetRowView(tweet: tweet)
                                .padding()
                        }
                    }
                }
                
                Button {
                    showNewTweetView.toggle()
                } label: {
                    Image("edit")
                        .resizable()
                        .renderingMode(.template)
                        .frame(width: 28, height: 28)
                        .padding()
                }
                .background(Color(.systemBlue))
                .foregroundColor(.white)
                .clipShape(Circle())
                .padding()
                .fullScreenCover(isPresented: $showNewTweetView) {
                    NewTweetView()
                }
            }
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
