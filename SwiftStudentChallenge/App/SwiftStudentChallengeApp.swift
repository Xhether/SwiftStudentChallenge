//
//  SwiftStudentChallengeApp.swift
//  SwiftStudentChallenge
//
//  Created by Charles Liggins on 12/20/23.
//

import SwiftUI
import Firebase

@main
struct SwiftStudentChallengeApp: App {
    @StateObject var viewModel = AuthViewModel()
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewModel)
        }
    }
}
