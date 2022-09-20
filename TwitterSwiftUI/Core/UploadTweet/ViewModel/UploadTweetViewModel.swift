//
//  UploadTweetViewModel.swift
//  TwitterSwiftUI
//
//  Created by Aman Joshi on 19/09/22.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth

class UploadTweetViewModel:ObservableObject {
    
    let service = TweetService()
    @Published var isUploaded = false
    
    func uploadTweet(withCaption caption:String) {
        service.uploadTweet(caption: caption) { success in
            if success {
                self.isUploaded = true
            }
        }
    }
    
    
}
