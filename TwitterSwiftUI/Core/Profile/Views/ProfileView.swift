//
//  ProfileView.swift
//  TwitterSwiftUI
//
//  Created by Apple on 25/07/22.
//

import SwiftUI
import Kingfisher

struct ProfileView: View {
    
    @State private var selectedFilter:TweetFilterViewModel = .tweets
    @Namespace var animation
    @Environment(\.presentationMode) var mode
    @ObservedObject private var viewModel:ProfileViewModel
    
    init(user:User) {
        self.viewModel = ProfileViewModel(user:user)
    }
    
    var body: some View {
        VStack(alignment:.leading) {
            headerView
            actionButtons
            userInfoDetails
            tweetFilterBar
            tweetsView
            Spacer()
        }
        .navigationBarHidden(true)
    }
}

extension ProfileView {
    
    var headerView:some View {
        ZStack(alignment: .bottomLeading) {
            Color(.systemBlue)
                .ignoresSafeArea()
            
            VStack {
                
                Button {
                    mode.wrappedValue.dismiss()
                } label: {
                    Image(systemName: "arrow.left")
                        .resizable()
                        .frame(width: 20, height: 16)
                        .foregroundColor(.white)
                        .offset(x: 16, y: -4)
                }
                
                
                KFImage(URL(string: viewModel.user.profileImageUrl))
                    .resizable()
                    .scaledToFill()
                    .clipShape(Circle())
                    .frame(width: 72, height: 72)
                    .offset(x: 16, y: 24)
            }
        }.frame(height: 96)
    }
    
    
    var actionButtons:some View {
        HStack(spacing:12) {
            Spacer()
            Image(systemName: "bell.badge")
                .font(.title)
                .padding(6)
                .overlay(Circle().stroke(Color.gray,lineWidth: 0.75))
            
            Button {
                //
            } label: {
                Text(viewModel.actionButtonTitle)
                    .font(.subheadline).bold()
                    .frame(width: 120, height: 32)
                    .foregroundColor(.black)
                    .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.gray,lineWidth: 0.75))
            }
        }.padding(.trailing)
    }
    
    var userInfoDetails:some View {
        VStack(alignment: .leading, spacing: 4) {
            HStack {
                Text(viewModel.user.fullname)
                    .font(.title2).bold()
                Image(systemName: "checkmark.seal.fill")
                    .foregroundColor(Color(.systemBlue))
                
            }
            
            Text("@\(viewModel.user.username)")
                .font(.subheadline)
                .foregroundColor(.gray)
            
            Text("Your mom's favorite villain")
                .font(.subheadline)
                .padding(.vertical)
            
            HStack(spacing:24){
                HStack {
                    Image(systemName: "mappin.and.ellipse")
                    
                    Text("Gotham, NY")
                }
                
                HStack {
                    Image(systemName: "link")
                    
                    Text("www.thejoker.com")
                }
            }
            .font(.caption)
            .foregroundColor(Color.gray)
            
            UserStatsView()
            .padding(.vertical)
        }.padding(.horizontal)
    }
    
    var tweetFilterBar: some View {
        HStack {
            ForEach(TweetFilterViewModel.allCases, id: \.rawValue) { item in
                VStack {
                    Text(item.title)
                        .font(.subheadline)
                        .fontWeight(selectedFilter == item ? .semibold : .regular)
                        .foregroundColor(selectedFilter == item ? .black : .gray)
                    if selectedFilter == item {
                        Capsule().fill(Color(.systemBlue))
                            .frame(height:3)
                            .matchedGeometryEffect(id: "filter", in: animation)
                    }else {
                        Capsule().fill(Color(.clear))
                            .frame(height:3)
                    }
                }
                .onTapGesture {
                    withAnimation(.easeInOut) {
                        selectedFilter = item
                    }
                }
            }
        }.overlay(Divider().offset(x: 0, y: 16))
    }
    
    
    var tweetsView:some View {
        ScrollView {
            LazyVStack {
                ForEach(viewModel.tweets(forFilter: self.selectedFilter),id: \.id) { tweet in
                    TweetRowView(tweet: tweet)
                }
            }
        }
    }
}
