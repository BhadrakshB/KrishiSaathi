//
//  ViewModel.swift
//  KrishiSaathi iOS
//
//  Created by Rishabh Lalwani on 25/09/23.
//

import Foundation
import UIKit

class ViewModel : ObservableObject {

    @Published var username: String = ""
    @Published var UID: String = ""
    @Published var name: String = ""
    @Published var email: String = ""
    @Published var isUserLoggedIn: Bool = false
    @Published var userImage: UIImage?
    
    func changeUid(text : String){
        self.UID = text
    }
}
