//
//  TwitterSwiftUIApp.swift
//  TwitterSwiftUI
//
//  Created by Apple on 04/07/22.
//

import SwiftUI
import FirebaseCore

@main
struct TwitterSwiftUIApp: App {
    
    @StateObject var viewModel = AuthViewModel()
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
            .environmentObject(viewModel)
        }
    }
}
