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
    @Published var searchText:String = ""
    
    var searchableUsers:[User] {
        if searchText.isEmpty {
            return users
        }else {
            let lowecasedQuery = searchText.lowercased()
            return users.filter {
                $0.username.contains(lowecasedQuery) ||
                $0.fullname.lowercased().contains(lowecasedQuery)
            }
        }
    }
    
    let service = UserService()
    
    init() {
        fetchUsers()
    }
    
    func fetchUsers() {
        service.fetchUsers { users in
                self.users = users
        }
    }
}
