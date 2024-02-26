//
//  ImageHelp.swift
//  SwiftStudentChallenge
//
//  Created by Charles Liggins on 2/25/24.
//

//import SwiftUI
//import PhotosUI
//
//struct ImagePicker: UIViewControllerRepresentable {
//    @Binding var selectedImage: UIImage?
//
//    class Coordinator: NSObject, PHPickerViewControllerDelegate {
//        var parent: ImagePicker
//
//        init(parent: ImagePicker) {
//            self.parent = parent
//        }
//
//        func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
//            if let itemProvider = results.first?.itemProvider, itemProvider.canLoadObject(ofClass: UIImage.self) {
//                itemProvider.loadObject(ofClass: UIImage.self) { (image, error) in
//                    if let image = image as? UIImage {
//                        DispatchQueue.main.async {
//                            self.parent.selectedImage = image
//                        }
//                    }
//                }
//            }
//        }
//    }
//
//    func makeCoordinator() -> Coordinator {
//        return Coordinator(parent: self)
//    }
//
//    func makeUIViewController(context: Context) -> PHPickerViewController {
//        var configuration = PHPickerConfiguration()
//        configuration.filter = .images
//        let picker = PHPickerViewController(configuration: configuration)
//        picker.delegate = context.coordinator
//        return picker
//    }
//
//    func updateUIViewController(_ uiViewController: PHPickerViewController, context: Context) {
//        // Update UI if needed
//    }
//}
