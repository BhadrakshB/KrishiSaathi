//
//  EmailLogIn.swift
//  KrishiSaathi iOS
//
//  Created by Rishabh Lalwani on 25/09/23.
//

import SwiftUI
import Firebase

struct EmailLogIn: View {
    
    @State private var showAlert = false
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var navigateToHomeScreen = false
    @EnvironmentObject var userData : ViewModel
    
    var body: some View {
        VStack{
            TextField("Email", text: $email)
                            .padding()
                            .background(Color(.secondarySystemBackground))
                            .cornerRadius(10)
                            .padding(.horizontal)
                            .disableAutocorrection(true)
                            .autocapitalization(.none)

            SecureField("Password", text: $password)
                .padding()
                .background(Color(.secondarySystemBackground))
                .cornerRadius(10)
                .padding(.horizontal)
                .disableAutocorrection(true)
                .autocapitalization(.none)
            
            Button(action: {
                           loginUser()
                       }) {
            Text("Log In")
                .foregroundColor(.white)
                .font(.headline)
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.blue)
                .cornerRadius(10)
                .padding(.horizontal)
                       }
        }
        .fullScreenCover(isPresented: $navigateToHomeScreen, content: {
            LogOut()
        })
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text("Login Failed"),
                message: Text("Invalid User Credentials"),
                dismissButton: .default(Text("OK"))
                    )
                }
    }
    
    func loginUser(){
        
        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
            if let e = error {
                showAlert = true
            }else{
                UserDefaults.standard.set(true, forKey: "isUserLoggedIn")
                navigateToHomeScreen = true
//                retrieveData()
            }
        }
    }
}

struct EmailLogIn_Previews: PreviewProvider {
    static var previews: some View {
        EmailLogIn()
    }
}
