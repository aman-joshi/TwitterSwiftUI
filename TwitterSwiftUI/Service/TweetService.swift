//
//  TweetService.swift
//  TwitterSwiftUI
//
//  Created by Aman Joshi on 19/09/22.
//

import FirebaseAuth
import FirebaseFirestore

struct TweetService {
    
    func uploadTweet(caption:String,completion:@escaping (Bool) -> Void) {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        let data = ["uid":uid,
                    "caption":caption,
                    "likes":0,
                    "timestamp":Timestamp(date: Date())] as [String : Any]
        
        Firestore.firestore().collection("tweets")
            .document().setData(data) { error in
                if let error = error {
                    completion(false)
                    print("DEBUG: error while uploading tweet - \(error.localizedDescription)")
                    return
                }
                completion(true)
                print("DEBUG: Did upload tweet")
                
            }
    }
    
    func fetchTweets(completion:@escaping ([Tweet]) -> Void) {
        var tweets:[Tweet] = []
        Firestore.firestore().collection("tweets")
            .order(by: "timestamp", descending: true)
            .getDocuments { snapshot, error in
            guard let documents = snapshot?.documents else { return }
            documents.forEach { document in
                guard let tweet = try? document.data(as: Tweet.self) else { return }
                tweets.append(tweet)
            }
            completion(tweets)
        }
    }
}
