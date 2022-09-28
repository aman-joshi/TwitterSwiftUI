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
        
        Firestore.firestore().collection(FirebaseConstants.Collection.tweets)
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
        Firestore.firestore().collection(FirebaseConstants.Collection.tweets)
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
    
    func fetchTweets(forUid uid:String,completion:@escaping ([Tweet]) -> Void) {
        var tweets:[Tweet] = []
        Firestore.firestore().collection(FirebaseConstants.Collection.tweets)
            .whereField("uid", isEqualTo: uid)
            .getDocuments { snapshot, error in
                guard let documents = snapshot?.documents else { return }
                documents.forEach { document in
                    guard let tweet = try? document.data(as: Tweet.self) else { return }
                    tweets.append(tweet)
                }
                completion(tweets.sorted(by: {$0.timestamp.dateValue() > $1.timestamp.dateValue() }))
            }
    }
    
}

//MARK: - Likes
extension TweetService {
    
    func likeTweet(_ tweet:Tweet,completion:@escaping () -> Void) {
        guard let uid = Auth.auth().currentUser?.uid else {return}
        guard let tweetId = tweet.id else { return }
        
        let userLikesRef = Firestore.firestore().collection(FirebaseConstants.Collection.users).document(uid).collection(FirebaseConstants.Collection.userLikes)
        
        Firestore.firestore().collection(FirebaseConstants.Collection.tweets).document(tweetId)
            .updateData(["likes":tweet.likes + 1]) { _ in
                userLikesRef.document(tweetId).setData([:]) { _ in
                    completion()
                }
            }
    }
    
    func unlikeTweet(_ tweet:Tweet,completion:@escaping () -> Void) {
        guard let uid = Auth.auth().currentUser?.uid else {return}
        guard let tweetId = tweet.id else { return }
        guard tweet.likes > 0 else { return }
        
        let userLikesRef = Firestore.firestore().collection(FirebaseConstants.Collection.users).document(uid).collection(FirebaseConstants.Collection.userLikes)
        
        Firestore.firestore().collection(FirebaseConstants.Collection.tweets).document(tweetId)
            .updateData(["likes":tweet.likes - 1]) { _ in
                userLikesRef.document(tweetId).delete() { _ in
                    completion()
                }
            }
    }
    
    func checkIfUserLikedTweet(_ tweet:Tweet, completion:@escaping (Bool) -> Void) {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        guard let tweetId = tweet.id else { return }
        
        Firestore.firestore().collection(FirebaseConstants.Collection.users)
            .document(uid).collection(FirebaseConstants.Collection.userLikes)
            .document(tweetId).getDocument { snapshot, error in
                guard let snapshot = snapshot else { return }
                completion(snapshot.exists)
            }
    }
    
    func fetchLikedTweets(forUid uid:String,completion:@escaping ([Tweet]) -> Void) {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        var tweets:[Tweet] = []
        Firestore.firestore().collection(FirebaseConstants.Collection.users)
            .document(uid)
            .collection(FirebaseConstants.Collection.userLikes)
            .getDocuments { snapshot, _ in
                guard let documents = snapshot?.documents else { return }
                
                documents.forEach { doc in
                    let tweetID = doc.documentID
                    
                    Firestore.firestore().collection(FirebaseConstants.Collection.tweets)
                        .document(tweetID).getDocument { snapshot, _ in
                            guard let tweet = try?.snapshot?.data(as: Tweet.self) else { return }
                            tweets.append(tweet)
                        }
                }
                completion(tweets)
            }
    }
}
