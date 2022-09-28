//
//  ProfileViewModel.swift
//  TwitterSwiftUI
//
//  Created by Aman Joshi on 21/09/22.
//

import Foundation

class ProfileViewModel:ObservableObject {
    
    @Published var tweets:[Tweet] = []
    @Published var likedTweets:[Tweet] = []
    
    private let service = TweetService()
    let user:User
    
    init(user:User) {
        self.user = user
        fetchUserTweets()
        fetchLikedTweets()
    }
    
    func tweets(forFilter filter:TweetFilterViewModel) -> [Tweet] {
        switch filter {
        case .tweets:
            return tweets
        case .replies:
            return tweets
        case .likes:
            return likedTweets
        }
    }
    
    func fetchUserTweets() {
        guard let uid = user.id else { return  }
        service.fetchTweets(forUid: uid) { tweets in
            self.tweets = tweets
            
            for i in 0..<tweets.count {
                self.tweets[i].user = self.user
            }
        }
    }
    
    func fetchLikedTweets() {
        guard let uid = user.id else { return }
        
        service.fetchLikedTweets(forUid: uid) { tweets in
            self.likedTweets = tweets
        }
    }
    
}
