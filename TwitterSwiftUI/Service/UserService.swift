//
//  UserService.swift
//  TwitterSwiftUI
//
//  Created by Aman Joshi on 17/09/22.
//

import FirebaseFirestore
import FirebaseAuth
import FirebaseCore

struct UserService {
    
    func fetchUser(withUid uid:String,completion:@escaping (User) -> Void) {
        Firestore.firestore().collection("users")
            .document(uid)
            .getDocument { snapshot, error in
                guard let _ = snapshot?.data() else { return }
                guard let user = try? snapshot?.data(as: User.self) else {return}
                completion(user)
            }
    }
    
    func fetchUsers(completion:@escaping ([User]) -> Void) {
        var users:[User] = []
        Firestore.firestore().collection("users")
            .getDocuments { snapshot, error in
                guard let documents = snapshot?.documents else { return }
                documents.forEach { snapshot in
                    guard let user = try? snapshot.data(as: User.self) else {return}
                    if user.id != Auth.auth().currentUser?.uid {
                        users.append(user)
                    }
                }
                completion(users)
            }
    }
    
}
