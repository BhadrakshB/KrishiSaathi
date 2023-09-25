//
//  KrishiSaathi_iOSApp.swift
//  KrishiSaathi iOS
//
//  Created by Rishabh Lalwani on 25/09/23.
//

import SwiftUI
import Firebase
import GoogleSignIn

@main
struct KrishiSaathi_iOSApp: App {
    
//    init(){
//        FirebaseApp.configure()
//    }
    
    let userData = ViewModel()
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(userData)
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,
                didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey :
                    Any]? = nil) -> Bool {
        FirebaseApp.configure ()
        return true
    }


    @available (iOS 9.0, *)

    func application(_ application: UIApplication, open url: URL, options:
    [UIApplication.OpenURLOptionsKey: Any] = [:]) -> Bool {
    return GIDSignIn.sharedInstance.handle(url)
    }
}
