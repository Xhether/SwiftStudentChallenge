//
//  FirebaseManager.swift
//  SwiftStudentChallenge
//
//  Created by Charles Liggins on 2/25/24.
//

import SwiftUI
import Firebase
import FirebaseStorage

class FirebaseManager: NSObject {
    let auth: Auth
    let storage: Storage
    
    static let shared = FirebaseManager()
    
    override init() {
        FirebaseApp.configure()
        self.auth = Auth.auth()
        self.storage = Storage.storage()
        super.init()
    }
}
