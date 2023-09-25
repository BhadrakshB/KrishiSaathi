//
//  LogInView.swift
//  KrishiSaathi iOS
//
//  Created by Rishabh Lalwani on 25/09/23.
//

import SwiftUI
import Firebase
import GoogleSignIn


struct SignInWithGoogle: View {
    
    @StateObject private var vm = SignIn_withGoogle_VM()
    @EnvironmentObject var userData : ViewModel
    
    @State private var navigateToHomeScreen = false
    
    var body: some View {
        VStack {
            Button(action: {
                vm.signInWithGoogle()
                UserDefaults.standard.set(true, forKey: "isUserLoggedIn")
                navigateToHomeScreen = true
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
    }
}

struct LogInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInWithGoogle()
    }
}
