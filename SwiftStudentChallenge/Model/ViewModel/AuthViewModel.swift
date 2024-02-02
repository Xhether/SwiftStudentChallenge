//
//  AuthViewModel.swift
//  SwiftStudentChallenge
//
//  Created by Charles Liggins on 1/1/24.
//

import Foundation
import Firebase
import SwiftUI
import FirebaseFirestoreSwift

@MainActor
class AuthViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?
    
    @Published private(set) var tasks: [TasksModel] = []
    @Published private(set) var areas: [AreaModel] = []
    @Published private(set) var subAreas: [SubAreaModel] = []


    
    init(){
       self.userSession = Auth.auth().currentUser
        
         getTasks()
         getAreas()
         getSubAreas()
        
        Task{
            await fetchUser()
        }
    }
    
    func signIn(withEmail email: String, password: String) async throws{
        print("Sign in...")
    }
    //config with default settings and such 
    func createUser(withEmail email: String, fullname: String, password: String) async throws{
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
            let user = User(id: result.user.uid, fullname: fullname, email: email, tasks: [], areas: [])
            let encodedUser = try Firestore.Encoder().encode(user)
            try await Firestore.firestore().collection("users").document(user.id).setData(encodedUser)
            await fetchUser()
        } catch {
            print("Debug: failed to create user with error \(error.localizedDescription)")
        }
    }
    
    func signOut() {}
    
    func deleteAccount() {}
    
    //get tasks for signed in user
    func getTasks() {
        Firestore.firestore().collection("tasks").addSnapshotListener { querySnapshot, error in
            guard let documents = querySnapshot?.documents else {
                print ("Error fetching doc")
                return
            }
            self.tasks = documents.compactMap { document -> TasksModel? in
                do {
                    return try document.data(as: TasksModel.self)
                } catch {
                    print("Error decoding as task")
                    return nil
                }                
            }
        }
    }
    
    //post tasks to tasks collection and user
    func makeTasks(name: String, priority: Int, dueDate: Date, areaUnder: String) {
        do {
            let newTask = TasksModel(id: "\(UUID())", dueDate: dueDate, areaUnder: areaUnder, priority: priority, name: name)
        
            try Firestore.firestore().collection("tasks").document().setData(from: newTask)
        } catch {
            print ("Error adding task to firestore: \(error)")
        }
    }
    
    //get areas for signed in user
    func getAreas() {
        Firestore.firestore().collection("areas").addSnapshotListener { querySnapshot, error in
            guard let documents = querySnapshot?.documents else {
                print ("Error fetching doc")
                return
            }
            self.areas = documents.compactMap { document -> AreaModel? in
                do {
                    return try document.data(as: AreaModel.self)
                } catch {
                    print("Error decoding as area")
                    return nil
                }
            }
        }
    }
    
    //post areas to areas collection and user
    func makeArea(name: String, color: Color) {
        do {
            let newArea = AreaModel(id: "\(UUID())", colorStr: color.description, name: name)
        
            try Firestore.firestore().collection("areas").document().setData(from: newArea)
        } catch {
            print ("Error adding task to firestore: \(error)")
        }
    }
    
    func getSubAreas() {
        Firestore.firestore().collection("subAreas").addSnapshotListener { querySnapshot, error in
            guard let documents = querySnapshot?.documents else {
                print ("Error fetching doc")
                return
            }
            self.subAreas = documents.compactMap { document -> SubAreaModel? in
                do {
                    return try document.data(as: SubAreaModel.self)
                } catch {
                    print("Error decoding as area")
                    return nil
                }
            }
        }
    }
    
    func makeSubArea(name: String, color: Color, areaUnder: String) {
        do {
            let newSubArea = SubAreaModel(id: "\(UUID())", colorStr: color.description, areaUnder: areaUnder, name: name)
        
            try Firestore.firestore().collection("subAreas").document().setData(from: newSubArea)
        } catch {
            print ("Error adding task to firestore: \(error)")
        }
    }
    
    func fetchUser() async {
        print("yoo im here rn dawg chillingf")
        guard let uid = Auth.auth().currentUser?.uid else { return }
        guard let snapshot = try? await Firestore.firestore().collection("users").document(uid).getDocument() else {return}
        self.currentUser = try? snapshot.data(as: User.self)
        }

    
}
