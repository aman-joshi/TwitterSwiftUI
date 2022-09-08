//
//  ContentView.swift
//  TwitterSwiftUI
//
//  Created by Apple on 04/07/22.
//

import SwiftUI

struct ContentView: View {
    @State private var showMenu = false
    @EnvironmentObject var viewModel:AuthViewModel
    
    var body: some View {
        Group {
            //user is not loggedIn
            if viewModel.userSession == nil {
                LoginView()
            }else {
                mainInterfaceView
            }
        }
    }
}

extension ContentView {
    var mainInterfaceView: some View {
        ZStack(alignment:.topLeading) {
            MainTabView()
                .navigationBarHidden(showMenu ? true : false)
            if showMenu {
                ZStack {
                    Color(.black)
                        .opacity(showMenu ? 0.2 : 0.0)
                }.onTapGesture {
                    withAnimation(.easeInOut) {
                        showMenu = false
                    }
                }
                .ignoresSafeArea()
            }
            
            SideMenuView()
                .frame(width:300)
                .offset(x: showMenu ? 0 : -300, y: 0)
                .background(showMenu ? Color.white : Color.clear)
        }
        .navigationTitle("Home")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    withAnimation(.easeInOut) {
                        showMenu.toggle()
                    }
                } label: {
                    Circle().frame(width: 32, height: 32)
                }
            }
        }
        .onAppear {
            showMenu = false
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

