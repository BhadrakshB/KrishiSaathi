//
//  HomeScreen.swift
//  KrishiSaathi iOS
//
//  Created by Rishabh Lalwani on 25/09/23.
//

import SwiftUI

struct LogOut: View {
    
    @EnvironmentObject var userData : ViewModel
    @State private var navigateToEmailLogIn = false
    var body: some View {
        VStack{
            Button(action: {
                UserDefaults.standard.set(false, forKey: "isUserLoggedIn")
                navigateToEmailLogIn.toggle()
                
            }) {
                Text("LogOut")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.red)
                    .cornerRadius(10)
            }
        }
        .fullScreenCover(isPresented: $navigateToEmailLogIn, content: {
            EmailLogIn()
        })
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        LogOut()
    }
}
