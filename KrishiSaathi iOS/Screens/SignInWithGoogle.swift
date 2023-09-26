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
                HStack {
                    Image("Google")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 30, height: 30)
                        .padding(.leading, 20)
                    
                    Text("Continue with Google")
                        .foregroundColor(.black)
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .padding()
                }
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.black, lineWidth: 2))
                .padding()
            }
        }
        .fullScreenCover(isPresented: $navigateToHomeScreen, content: {
            TabsView()
        })
    }
}

struct LogInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInWithGoogle()
    }
}
