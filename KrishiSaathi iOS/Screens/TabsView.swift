//
//  TabsView.swift
//  KrishiSaathi iOS
//
//  Created by Rishabh Lalwani on 26/09/23.
//

import SwiftUI

struct TabsView: View {
    @EnvironmentObject var userData : ViewModel

    //MARK: - BODY
    var body: some View {
        
        
        //MARK: - TABVIEW
        TabView {
            
            //MARK: - HOMEVIEW
            NavigationView {
                PredictView()
            }
                .tabItem {
                    Image(systemName: "house.circle")
                    Text("Home")
                }
                
            //MARK: - FEEDVIEW
            NavigationView {
//                FeedView()
            }
                .tabItem {
                    Image(systemName: "book.fill")
                    Text("Past")
                }
                
            //MARK: - BROWSEVIEW
            NavigationView {
                LogOut()
            }
                .tabItem {
                    Image(systemName: "line.3.horizontal")
                    Text("Profile")
                }
                
                
        }
        
    }
}

struct TabsView_Previews: PreviewProvider {
    static var previews: some View {
        TabsView()
    }
}
