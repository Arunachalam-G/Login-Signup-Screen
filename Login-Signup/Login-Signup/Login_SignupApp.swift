//
//  Login_SignupApp.swift
//  Login-Signup
//
//  Created by Arunachalam Ganesan on 13/01/22.
//

import SwiftUI

@main
struct Login_SignupApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(showingView: ShowingView(showingView: .LoginView))
        }
    }
}
