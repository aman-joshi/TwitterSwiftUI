//
//  User.swift
//  TwitterSwiftUI
//
//  Created by Aman Joshi on 17/09/22.
//

import FirebaseFirestoreSwift
import FirebaseAuth

struct User:Identifiable,Decodable {
    @DocumentID var id:String?
    let username:String
    let fullname:String
    let profileImageUrl:String
    let email:String
    
    var isCurrentUser:Bool { return Auth.auth().currentUser?.uid == id }
}
