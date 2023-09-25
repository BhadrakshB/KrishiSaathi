//
//  KrishiSaathi_iOSApp.swift
//  KrishiSaathi iOS
//
//  Created by Rishabh Lalwani on 25/09/23.
//

import SwiftUI
import Firebase

@main
struct KrishiSaathi_iOSApp: App {
    
    init(){
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
