//
//  User.swift
//  TwitterSwiftUI
//
//  Created by Aman Joshi on 17/09/22.
//

import FirebaseFirestoreSwift

struct User:Identifiable,Decodable {
    @DocumentID var id:String?
    let username:String
    let fullname:String
    let profileImageUrl:String
    let email:String
}
