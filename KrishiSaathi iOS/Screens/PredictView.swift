//
//  PredictView.swift
//  KrishiSaathi iOS
//
//  Created by Rishabh Lalwani on 25/09/23.
//

import SwiftUI


struct PredictView: View {
        private var data : Data
    
        @State private var selectedCrop = "Select Crop"
        @State private var selectedSeason = "Select Season"
        @State private var selectedState = "Select State"
        @State private var areaInput : Double
        @State private var annualInput : Double
        @State private var fertilizerInput : Double
        @State private var pesticideInput : Double
    
        init(){
            data = Data()
            self.areaInput = 0.0
            self.annualInput = 0.0
            self.fertilizerInput = 0.0
            self.pesticideInput = 0.0
        }
        
        var body: some View {
            VStack {
                // Crop Dropdown
                DropdownPicker(title: "Crop", selection: $selectedCrop, options: data.cropNames)
                
                // Season Dropdown
                DropdownPicker(title: "Season", selection: $selectedSeason, options: data.croppingSeason)
                
                // State Dropdown
                DropdownPicker(title: "State", selection: $selectedState, options: data.states)
                
                // Area Input
                HStack {
                    Text("Area")
                    TextField("Area (acres)", value: $areaInput, formatter: NumberFormatter())
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                
                // Annual Input
                HStack {
                    Text("Rainfall")
                    TextField("Annual (float)", value: $annualInput, formatter: NumberFormatter())
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                
                // Fertilizer Input
                HStack {
                    Text("Fertilizer")
                    TextField("Fertilizer (float)", value: $fertilizerInput, formatter: NumberFormatter())
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                
                // Pesticide Input
                HStack {
                    Text("Pesticide")
                    TextField("Pesticide (float)", value: $pesticideInput, formatter: NumberFormatter())
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                
                // Predict Button
                Button(action: {
                    // Add your prediction logic here
                    print("Predict button tapped")
                }) {
                    Text("Predict")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
            .padding()
        }
}

struct PredictView_Previews: PreviewProvider {
    static var previews: some View {
        PredictView()
    }
}

struct DropdownPicker: View {
    var title: String
    @Binding var selection: String
    var options: [String]

    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.headline)
            Picker(selection: $selection, label: Text("")) {
                ForEach(options, id: \.self) { option in
                    Text(option)
                }
            }
            .pickerStyle(MenuPickerStyle())
        }
    }
}
