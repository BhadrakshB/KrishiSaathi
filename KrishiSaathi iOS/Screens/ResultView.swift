//
//  ResultView.swift
//  KrishiSaathi iOS
//
//  Created by Rishabh Lalwani on 26/09/23.
//

import SwiftUI

struct ResultView: View {
    let yield : String
    @State private var navigateToPredictView = false
    
    var body: some View {
        VStack{
            Text("Based on the details,")
                .font(.title)
            Text("Your Yield would be")
                .font(.title)
            
            Text("\(yield)")
                .font(.system(size: 72, weight: .bold, design: .default))
            
            
            
            Button(action: {
                
                navigateToPredictView.toggle()
                
            }) {
                Text("Change Details")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.red)
                    .cornerRadius(10)
            }
        }
        .fullScreenCover(isPresented: $navigateToPredictView, content: {
            TabsView()
        })
    }
}

struct ResultView_Previews: PreviewProvider {
    static var previews: some View {
        ResultView(yield: "100.11")
    }
}
