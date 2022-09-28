//
//  Tweet.swift
//  TwitterSwiftUI
//
//  Created by Aman Joshi on 20/09/22.
//

import FirebaseFirestoreSwift
import FirebaseFirestore

struct Tweet:Identifiable,Decodable {
    @DocumentID var id:String?
    let caption:String
    let likes:Int
    let timestamp:Timestamp
    let uid:String
    
    var user:User?
    var didLike:Bool? = false
}
