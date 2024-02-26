//
//  ProfileView.swift
//  SwiftStudentChallenge
//
//  Created by Charles Liggins on 1/4/24.
//

import SwiftUI
import SDWebImageSwiftUI
import SDWebImage
import FirebaseFirestore
import FirebaseStorage
import PhotosUI

struct ImagePicker: UIViewControllerRepresentable {
    @Binding var selectedImage: UIImage?

    class Coordinator: NSObject, PHPickerViewControllerDelegate {
        var parent: ImagePicker

        init(parent: ImagePicker) {
            self.parent = parent
        }

        func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
            if let itemProvider = results.first?.itemProvider, itemProvider.canLoadObject(ofClass: UIImage.self) {
                itemProvider.loadObject(ofClass: UIImage.self) { (image, error) in
                    if let image = image as? UIImage {
                        DispatchQueue.main.async {
                            self.parent.selectedImage = image
                        }
                    }
                }
            }
        }
    }

    func makeCoordinator() -> Coordinator {
        return Coordinator(parent: self)
    }

    func makeUIViewController(context: Context) -> PHPickerViewController {
        var configuration = PHPickerConfiguration()
        configuration.filter = .images
        let picker = PHPickerViewController(configuration: configuration)
        picker.delegate = context.coordinator
        return picker
    }

    func updateUIViewController(_ uiViewController: PHPickerViewController, context: Context) {
        // Update UI if needed
    }
}



struct ProfileView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    @EnvironmentObject var logistics: LogisticsInfo
    @State private var selectedImage: UIImage?
    @State var pickerState = true
    @State var retrievedImages =  [UIImage]()
    
    var body: some View{
        if let user = viewModel.currentUser {
            NavigationStack{
                VStack {
                    //Header
                    HStack{
                        Text("Profile")
                            .font(.largeTitle)
                            .padding(.leading, 30)
                            .padding(.bottom, 30)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .bold()
                        
                        NavigationLink {
                            Home()
                        } label: {
                            Image(systemName: "house")
                                .font(.system(size: 40, weight: .bold))
                        }
                        .padding(.trailing, 30)
                        .padding(.bottom, 20)
                        
                        NavigationLink {
                            SettingsView()
                        } label: {
                            Image(systemName: "gear")
                                .font(.system(size: 40, weight: .bold))
                        }
                        .padding(.trailing, 30)
                        .padding(.bottom, 20)
                        
                    }
                    
                    VStack {
                        if pickerState {
                            ImagePicker(selectedImage: $selectedImage)
                                .frame(width: 250, height: 250)
                        }
                    
                        
                        if let selectedImage = selectedImage {
                            
                            Text("Image selected!")
                                .padding()
                            Image(uiImage: selectedImage)
                                .resizable()
                                .frame(width: 200, height: 200)
                                .clipShape(.circle)

                                
                                Button {
                                    uploadPhoto()
                                    pickerState = false
                                } label: {
                                    Text("Save")
                                }
                        }
                        
                        Text(user.fullname)
                            .font(.headline)
                        ScrollView(.vertical){
                            Text("Logistics")
                                .font(.title2)
                                .padding(.leading, 30)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .bold()
                            
                            Divider()
                                .padding(.leading, 30)
                                .padding(.trailing, 30)
                                .padding(.bottom, 30)
                            
                            //NOTE: IMPLEMENT
                            
                            VStack{
                                
                                Text("You've completed \(logistics.lateTasksCompleted) tasks late this month")
                                Text("You have \(logistics.upcomingTasks) upcoming tasks this month")
                                Text("You've completed \(logistics.onTimeTasksCompleted) tasks this month")

                            }
                            
                            Spacer()
                            
                            Text("Friends")
                                .font(.title2)
                                .padding(.leading, 30)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .bold()
                            
                            //display all users
                            
                            
                            Divider()
                                .padding(.leading, 30)
                                .padding(.trailing, 30)
                            
                            HStack{
                                
                            
                                
                                //user with name and profile image
                                ForEach(viewModel.users, id: \.self) { user in
                                    ForEach(retrievedImages, id: \.self) { image in
                                        Image(uiImage: image)
                                            .resizable()
                                            .frame(width: 100, height: 100)
                                    }
                                    
                                    Text(user.fullname)
                                    
                                }
                                
                            }.onAppear {
                                retrievePhotos()
                            }
                            
                            Spacer()
                        }
                        
                    }
                }
            }
        }
    }
        

    
    func uploadPhoto() {
       guard selectedImage != nil else{return}
       let identifier = viewModel.currentUser?.id
       let storageRef = Storage.storage().reference()
       let imageData = selectedImage!.jpegData(compressionQuality: 0.8)
               
       guard imageData != nil else{return}
       
       let fileRef = storageRef.child("images \(identifier!).jpeg")

       let uploadTask = fileRef.putData(imageData!, metadata: nil) {
           metadata, error in
           
           if error == nil && metadata != nil {
               Firestore.firestore().collection("images").document().setData(["url": "images \(UUID().uuidString).jpeg" ,"id": identifier])
               
               if error == nil {
                   DispatchQueue.main.async {
                       self.retrievedImages.append(self.selectedImage!)
                   }
               }
               
           }
       }
   }
    
    func retrievePhotos() {
        Firestore.firestore().collection("images").getDocuments { snapshot, error in
            
            if error == nil && snapshot != nil {
                var paths = [String]()
                
                for doc in snapshot!.documents {
                    paths.append(doc["url"] as! String)
                }
                
                for path in paths {
                    let storageRef = Storage.storage().reference()
                    let fileRef = storageRef.child(path)
                    
                    fileRef.getData(maxSize: 5 * 1024 * 1024) { data, error in
                        if error == nil && data != nil {
                            if let image = UIImage(data: data!) {
                                DispatchQueue.main.async {
                                    retrievedImages.append(image)
                                }
                            }
                        }
                        
                    }
                }
            }
        }
    }
}



//#Preview {
//   ProfileView().environmentObject(LogisticsInfo())
//
//}
