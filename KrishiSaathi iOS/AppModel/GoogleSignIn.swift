//
//  GoogleSignIn.swift
//  KrishiSaathi iOS
//
//  Created by Rishabh Lalwani on 25/09/23.
//

import Foundation
import SwiftUI
import Firebase
import GoogleSignIn


class SignIn_withGoogle_VM: ObservableObject{
    @EnvironmentObject var userData : ViewModel
    @Published var isLoginSuccessed = false
    
    func signInWithGoogle(completion: @escaping (Bool) -> Void) {
        guard let clientID = FirebaseApp.app()?.options.clientID else {
            completion(false)
            return }
        
        // Create Google Sign In configuration object.
        let config = GIDConfiguration(clientID: clientID)
        GIDSignIn.sharedInstance.configuration = config
        
        // Start the sign in flow!
        GIDSignIn.sharedInstance.signIn(withPresenting: Applicaiton_utility.rootViewController) { user, error in
            
            if let error = error {
                print(error.localizedDescription)
                completion(false)
                return
            }
            
            
            guard
                let user = user?.user,
                let idToken = user.idToken else {
                completion(false)
                return
            }
            
            
            
            
            let accessToken = user.accessToken
            
            let credential = GoogleAuthProvider.credential(withIDToken: idToken.tokenString,
                                                           accessToken: accessToken.tokenString)
            
            Auth.auth().signIn (with: credential) { res, error in
                if let error = error {
                    print (error.localizedDescription)
                    completion(false)
                    return
                }
                    
                    guard let user = res?.user else {
                        completion(false)
                        return
                        
                    }
                    let uid = res?.user.uid
                    UserDefaults.standard.set(uid, forKey: "uid")
                    completion(true)
                }
            }
        }
    }
