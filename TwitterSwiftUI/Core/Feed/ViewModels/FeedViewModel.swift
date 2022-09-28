//
//  FeedViewModel.swift
//  TwitterSwiftUI
//
//  Created by Aman Joshi on 20/09/22.
//

import Foundation
import FirebaseFirestore

class FeedViewModel:ObservableObject {
    
    private let service = TweetService()
    private let userService = UserService()
    
    @Published private(set) var tweets = [Tweet]()
    
    init() {
        self.fetchTweets()
    }
    
    func fetchTweets() {
        service.fetchTweets(completion: { tweets in
            self.tweets = tweets
            
            for index in 0..<tweets.count {
                self.userService.fetchUser(withUid: tweets[index].uid) { user in
                    self.tweets[index].user = user
                }
            }
        })
    }
}
