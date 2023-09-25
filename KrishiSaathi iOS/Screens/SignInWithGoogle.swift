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
    
    var body: some View {
        Button(action: {
            vm.signInWithGoogle()
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
}

struct LogInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInWithGoogle()
    }
}
