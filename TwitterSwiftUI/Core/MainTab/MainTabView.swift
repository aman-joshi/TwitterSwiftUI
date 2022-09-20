//
//  MainTabView.swift
//  TwitterSwiftUI
//
//  Created by Apple on 18/07/22.
//

import SwiftUI

struct MainTabView: View {
    
    @State private var selectedIndex = 0
    
    var body: some View {
        TabView(selection: $selectedIndex) {
            FeedView()
                .onTapGesture {
                    selectedIndex = 0
                }.tabItem {
                    Image(systemName: "house")
                }.tag(0)
            ExploreView()
                .onTapGesture {
                    selectedIndex = 1
                }.tabItem {
                    Image(systemName: "magnifyingglass")
                }.tag(1)
            NotificationsView()
                .onTapGesture {
                    selectedIndex = 2
                }.tabItem {
                    Image(systemName: "bell")
                }.tag(2)
            MessagesView()
                .onTapGesture {
                    selectedIndex = 3
                }.tabItem {
                    Image(systemName: "envelope")
                }.tag(3)
        }
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
