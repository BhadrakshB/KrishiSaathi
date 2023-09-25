//
//  EmailSignUp.swift
//  KrishiSaathi iOS
//
//  Created by Rishabh Lalwani on 25/09/23.
//

import SwiftUI
import Firebase

struct EmailSignUp: View {
    @EnvironmentObject var userData : ViewModel
    
    @State private var email: String = ""
    @State private var password: String = ""
    @State var username: String = ""
    @State private var navigateToHomeScreen = false
    
    var body: some View {
        VStack{
            TextField("Username", text: $username)
                .padding()
                .background(Color(.secondarySystemBackground))
                .cornerRadius(10)
                .padding(.horizontal)
                .disableAutocorrection(true)
                .autocapitalization(.none)
            
            
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
                registerUser()
            }) {
                Text("Sign Up")
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
    }
    
    func registerUser(){
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if error != nil {
                print(error!)
            }
            else{
                guard let uid = result?.user.uid else { return }
                UserDefaults.standard.set(true, forKey: "isUserLoggedIn")
                navigateToHomeScreen = true
                print(uid)
            }
        }
    }
    
}

struct EmailSignUp_Previews: PreviewProvider {
    static var previews: some View {
        EmailSignUp()
    }
}
