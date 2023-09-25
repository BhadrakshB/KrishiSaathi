//
//  ContentView.swift
//  KrishiSaathi iOS
//
//  Created by Rishabh Lalwani on 25/09/23.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var userData : ViewModel
    
    func retrieveData(){
        userData.isUserLoggedIn = UserDefaults.standard.bool(forKey: "isUserLoggedIn")
    }

    
    var body: some View {
        if UserDefaults.standard.bool(forKey: "isUserLoggedIn") {
            TabsView()
                .onAppear{
//                    retrieveData()
                }
            
        }else{
            SignUpView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
