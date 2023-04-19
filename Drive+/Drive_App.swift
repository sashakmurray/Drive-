//
//  Drive_App.swift
//  Drive+
//
//  Created by Sasha Murray (student LM) on 2/22/23.
//

import SwiftUI
import FirebaseCore
import FirebaseAuth
import GoogleSignIn

@main



struct Drive_App: App {
    @StateObject var viewModel = AuthenticationViewModel()
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onAppear {
                    GIDSignIn.sharedInstance.restorePreviousSignIn { user, error in
                        viewModel.signIn()
                    }
                }
                .onOpenURL { url in
                    GIDSignIn.sharedInstance.handle(url)
                }.environmentObject(viewModel)
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        return GIDSignIn.sharedInstance.handle(url)
    }
}
