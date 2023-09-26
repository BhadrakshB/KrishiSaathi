//
//  EmailSignUp.swift
//  KrishiSaathi iOS
//
//  Created by Rishabh Lalwani on 25/09/23.
//

import SwiftUI
import Firebase

struct SignUpView: View {
    @EnvironmentObject var userData : ViewModel
    
    @State private var email: String = ""
    @State private var password: String = ""
    @State var username: String = ""
    @State private var navigateToHomeScreen = false
    @State private var navigateToLogInView = false
    @State private var navigateAddDetailsView = false
    
    var body: some View {
        VStack{
            
            SignInWithGoogle()
                .padding()
            
            Rectangle()
                .frame(height: 1)
                .padding(.horizontal, 20)
                .padding(.vertical, 30)
            
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
            
            Button(action: {
                navigateToLogInView.toggle()
            }) {
                    
                    Text("Already have an account. Click Here")
                        
            }
            
        }
        .fullScreenCover(isPresented: $navigateToHomeScreen, content: {
            TabsView()
        })
        .fullScreenCover(isPresented: $navigateToLogInView, content: {
            LogInView()
        })
        .fullScreenCover(isPresented: $navigateAddDetailsView, content: {
            AddDetailsView()
        })
    }
    
    func registerUser(){
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if error != nil {
                print(error!)
            }
            else{
                guard let uid = result?.user.uid else { return }
                userData.UID = uid
                UserDefaults.standard.set(true, forKey: "isUserLoggedIn")
                navigateAddDetailsView = true
                print(uid)
            }
        }
    }
    
}

struct EmailSignUp_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
