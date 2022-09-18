//
//  ExploreViewModel.swift
//  TwitterSwiftUI
//
//  Created by Aman Joshi on 18/09/22.
//

import Foundation
import FirebaseAuth

class ExploreViewModel:ObservableObject {
    
    @Published var users:[User] = []
    let service = UserService()
    
    init() {
        fetchUsers()
    }
    
    func fetchUsers() {
        service.fetchUsers { users in
            print("DEBUG:users is \(users)")
                self.users = users
        }
    }
}
