//
//  AuthViewModel.swift
//  TwitterSwiftUI
//
//  Created by Aman Joshi on 08/09/22.
//

import FirebaseAuth
import FirebaseFirestore
import SwiftUI

class AuthViewModel:ObservableObject {
    @Published var userSession:FirebaseAuth.User?
    @Published var didAuthenticateUser:Bool = false
    private var tempUserSession:FirebaseAuth.User?
    
    init() {
        self.userSession = Auth.auth().currentUser
    }
    
    func login(withEmail email:String, password:String) {
        print("DEBUG:Login user")
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                print("DEBUG: Failed to login with error \(error.localizedDescription)")
                return
            }
            guard let user = result?.user else { return }
            self.userSession = user
        }
    }
    
    func register(withEmail email:String,password:String,fullname:String,username:String) {
        print("DEBUG:Register user")
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                print("DEBUG: Failed to register with error \(error.localizedDescription)")
                return
            }
            guard let user = result?.user else { return }
            self.tempUserSession = user
            let data = ["email":email,"username":username.lowercased(),"fullname":fullname,"uid":user.uid]
            
            Firestore.firestore().collection("users")
                .document(user.uid)
                .setData(data, completion: { _ in
                    print("Did upload user info")
                    self.didAuthenticateUser = true
                })
        }
    }
    
    func signout() {
        userSession = nil
        try? Auth.auth().signOut()
    }
    
    func uploadProfileImage(image:UIImage) {
        guard let uid = tempUserSession?.uid else { return }
        ImageUploader.uploadImage(image: image) { profileImageUrl in
            Firestore.firestore().collection("users")
                .document(uid)
                .updateData(["profileImageUrl":profileImageUrl]) { [weak self] _ in
                    self?.userSession = self?.tempUserSession
                }
        }
    }
}

