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
    @State private var phone: String = ""
    @State private var land: String = ""
    @State private var city: String = ""
    @State private var weatherAlerts = true
    @State private var showImagePicker = false
    @State private var navigateToPredictView = false
    
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
            .disableAutocorrection(true)
            .autocapitalization(.none)
            
            TextField("Phone Number", text: $phone)
            .padding()
            .disableAutocorrection(true)
            .autocapitalization(.none)
            
            TextField("Land Size", text: $land)
            .padding()
            .disableAutocorrection(true)
            .autocapitalization(.none)
            
            TextField("Cityname", text: $city)
            .padding()
            .disableAutocorrection(true)
            .autocapitalization(.none)
            
            Toggle("Send me weather alerts", isOn: $weatherAlerts)
                        .padding()
            
            Button(action: {
                self.showImagePicker = true
            }) {
                Text("Choose Image")
            }
            .padding()
            .sheet(isPresented: $showImagePicker) {
                            ImagePicker(image: self.$image, isShown: self.$showImagePicker)
                        }
            
            Button(action: {
                navigateToPredictView.toggle()
                       }) {
            Text("Continue")
                .foregroundColor(.white)
                .font(.headline)
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.blue)
                .cornerRadius(10)
                .padding(.horizontal)
            }
            
        }
        .fullScreenCover(isPresented: $navigateToPredictView, content: {
            TabsView()
        })
    }
}

struct AddDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        AddDetailsView()
    }
}

struct ImagePicker: UIViewControllerRepresentable {
    @Binding var image: UIImage?
    @Binding var isShown: Bool

    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) -> UIImagePickerController {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = context.coordinator
        return imagePicker
    }

    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<ImagePicker>) {

    }

    func makeCoordinator() -> Coordinator {
        return Coordinator(self)
    }

    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        let parent: ImagePicker

        init(_ parent: ImagePicker) {
            self.parent = parent
        }

        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let selectedImage = info[.originalImage] as? UIImage {
                self.parent.image = selectedImage
            }
            self.parent.isShown = false
        }

        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            self.parent.isShown = false
        }
    }
}
