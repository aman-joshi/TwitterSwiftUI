//
//  ImageUploader.swift
//  TwitterSwiftUI
//
//  Created by Aman Joshi on 12/09/22.
//

import FirebaseCore
import FirebaseFirestore
import FirebaseStorage
import UIKit

struct ImageUploader {
    
    static func uploadImage(image:UIImage,completionHandler:@escaping (String) -> Void) {
        guard let imageData = image.jpegData(compressionQuality: 0.5) else { return }
        
        let fileName = UUID().uuidString
        let ref = Storage.storage().reference(withPath: "/profile_image/\(fileName)")
        ref.putData(imageData,metadata: nil) { _, error in
            if let error = error {
                print("DEBUG: Unable to upload image - \(error.localizedDescription)")
                return
            }
            ref.downloadURL { imageUrl, _ in
                if let imageUrl = imageUrl {
                    completionHandler(imageUrl.absoluteString)
                }
            }
        }
    }
}
