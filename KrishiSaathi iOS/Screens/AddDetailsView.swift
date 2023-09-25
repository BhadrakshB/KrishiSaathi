//
//  AddDetailsView.swift
//  KrishiSaathi iOS
//
//  Created by Rishabh Lalwani on 25/09/23.
//

import SwiftUI

struct AddDetailsView: View {
    @EnvironmentObject var userData : ViewModel
    
    @State private var image: UIImage?
    @State private var name: String = ""
    
    var body: some View {
        VStack{
            //MARK: - PROFILEIMAGE
            if let image = image {
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 100, height: 100)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 4))
                    .shadow(radius: 7)
            }
            
            TextField("Name", text: $name)
            .padding()
            .disableAutocorrection(true) // Disable autocorrect
            .autocapitalization(.none)
            
            
        }
    }
}

struct AddDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        AddDetailsView()
    }
}
