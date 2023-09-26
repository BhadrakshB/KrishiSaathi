//
//  PredictView.swift
//  KrishiSaathi iOS
//
//  Created by Rishabh Lalwani on 25/09/23.
//

import SwiftUI


struct PredictView: View {
        private var data : Data
        @EnvironmentObject var userData : ViewModel
        
    let weatherURL = "weatherURL"
        @State private var selectedCrop = "Select Crop"
        @State private var selectedSeason = "Select Season"
        @State private var selectedState = "Select State"
        @State private var areaInput : Double
        @State private var annualInput : Double
        @State private var fertilizerInput : Double
        @State private var pesticideInput : Double
        @State private var yield : Float
    
        init(){
            data = Data()
            self.areaInput = 0.0
            self.annualInput = 0.0
            self.fertilizerInput = 0.0
            self.pesticideInput = 0.0
            self.yield = 0.0
        }
        
        var body: some View {
            NavigationView{
                VStack {
                    // Crop Dropdown
                    DropdownPicker(title: "Drop", selection: $selectedCrop, options: data.cropNames)
                    
                    // Season Dropdown
                    DropdownPicker(title: "Season", selection: $selectedSeason, options: data.croppingSeason)
                    
                    // State Dropdown
                    DropdownPicker(title: "State", selection: $selectedState, options: data.states)
                    
                    // Area Input
                    HStack {
                        Text("Area")
                        Spacer()
                        TextField("Area (acres)", value: $areaInput, formatter: NumberFormatter())
                            .padding()
                            .background(Color(.secondarySystemBackground))
                            .cornerRadius(10)
                            .padding(.horizontal)
                            .disableAutocorrection(true)
                            .autocapitalization(.none)
                            .frame(width: 200)
                    }
                    
                    // Annual Input
                    HStack {
                        Text("Rainfall")
                        Spacer()
                        TextField("Annual (float)", value: $annualInput, formatter: NumberFormatter())
                            .padding()
                            .background(Color(.secondarySystemBackground))
                            .cornerRadius(10)
                            .padding(.horizontal)
                            .disableAutocorrection(true)
                            .autocapitalization(.none)
                            .frame(width: 200)
                    }
                    
                    // Fertilizer Input
                    HStack {
                        Text("Fertilizer")
                        Spacer()
                        TextField("Fertilizer (float)", value: $fertilizerInput, formatter: NumberFormatter())
                            .padding()
                            .background(Color(.secondarySystemBackground))
                            .cornerRadius(10)
                            .padding(.horizontal)
                            .disableAutocorrection(true)
                            .autocapitalization(.none)
                            .frame(width: 200)
                    }
                    
                    // Pesticide Input
                    HStack {
                        Text("Pesticide")
                        Spacer()
                        TextField("Pesticide (float)", value: $pesticideInput, formatter: NumberFormatter())
                            .padding()
                            .background(Color(.secondarySystemBackground))
                            .cornerRadius(10)
                            .padding(.horizontal)
                            .disableAutocorrection(true)
                            .autocapitalization(.none)
                            .frame(width: 200)
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
                            .padding(.top, 10)
                    }
                }
                .padding()
            }
            .navigationTitle("Predict Yield")
        }
    
    func fetchData() {
            guard let url = URL(string: "api.openweathermap.org/data/2.5/forecast?appid={{appid}}&q=Orai") else {
                return
            }

            URLSession.shared.dataTask(with: url) { data, _, error in
                if let data = data {
                    do {
                        let decodedData = try JSONDecoder().decode(YieldData.self, from: data)
                        DispatchQueue.main.async {
                            self.yield = decodedData.yield_inMetricTons
                            print(yield)
                        }
                    } catch {
                        print("Error decoding data: \(error)")
                    }
                } else if let error = error {
                    print("Error fetching data: \(error)")
                }
            }.resume()
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
        HStack(alignment: .top) {
            Text(title)
                .padding(.bottom, 30)
            Spacer()
            Picker(selection: $selection, label: Text("")) {
                ForEach(options, id: \.self) { option in
                    Text(option)
                }
            }
            .padding(.bottom, 20)
            .pickerStyle(MenuPickerStyle())
        }
    }
    
    
}

