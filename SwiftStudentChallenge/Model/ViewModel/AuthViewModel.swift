//
//  AuthViewModel.swift
//  SwiftStudentChallenge
//
//  Created by Charles Liggins on 1/1/24.
//

import Foundation
import Firebase
import SwiftUI
import FirebaseStorage
import FirebaseFirestoreSwift

@MainActor
class AuthViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?
    @Published var db = Firestore.firestore()
    @Published private(set) var users: [User] = []
    @Published private(set) var goals: [Goal] = []
    @Published private(set) var tasks: [TasksModel] = []
    @Published private(set) var areas: [AreaModel] = []
    @Published private(set) var subAreas: [SubAreaModel] = []


    
    init(){
         self.userSession = Auth.auth().currentUser
        
         getTasks()
         getAreas()
         getGoals()
         getSubAreas()
         getUsers()
        
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
            let user = User(id: result.user.uid, fullname: fullname,email: email, image: "", tasks: [], areas: [])
            let encodedUser = try Firestore.Encoder().encode(user)
            try await Firestore.firestore().collection("users").document(user.id).setData(encodedUser)
            await fetchUser()
        } catch {
            print("Debug: failed to create user with error \(error.localizedDescription)")
        }
    }
    
    func getUsers() {
        Firestore.firestore().collection("users").addSnapshotListener { querySnapshot, error in
            guard let documents = querySnapshot?.documents else {
                print ("Error fetching doc")
                return
            }
            self.users = documents.compactMap { document -> User? in
                do {
                    return try document.data(as: User.self)
                } catch {
                    print("Error decoding as user")
                    return nil
                }
            }
        }
    }
    
    //set the users picture
    func setPicture(image: String) {
        let x = db.collection("users").document(self.currentUser!.id).documentID
        db.collection("users").document(x).updateData(["image":image])
    }
    
    func signOut() {
        do {
            try Auth.auth().signOut()
            self.userSession = nil
            self.currentUser = nil
        } catch {
            print("Debug: Failed to sign user out with error \(error.localizedDescription)")
        }
    }
    
    func deleteAccount() {}
    
    //get tasks for signed in user
    func getTasks() {
        db.collection("tasks").addSnapshotListener { querySnapshot, error in
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
        
            try Firestore.firestore().collection("tasks").document(newTask.id).setData(from: newTask)
        } catch {
            print ("Error adding task to firestore: \(error)")
        }
    }
    
    // delete request for tasks, UPDATE
    func deleteTask(id: String)  {
        db.collection("tasks").document(id).delete() { err in
            if let err = err {
                print("Error removing document: \(err)")
            } else {
                print("Document removed!")
            }
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
    
    func makeGoal(name: String, areaUnder: String) {
        do {
            let newGoal = Goal(id: "\(UUID())", areaUnder: areaUnder, name: name)
            
            try Firestore.firestore().collection("goals").document().setData(from: newGoal)
        } catch {
            print ("Error adding goal to firestore: \(error)")
        }
    }
    
    func getGoals() {
        db.collection("goals").addSnapshotListener { querySnapshot, error in
            guard let documents = querySnapshot?.documents else {
                print ("Error fetching doc")
                return
            }
            self.goals = documents.compactMap { document -> Goal? in
                do {
                    return try document.data(as: Goal.self)
                } catch {
                    print("Error decoding as task")
                    return nil
                }
            }
        }
    }
    
    
    
    func fetchUser() async {
    //  print("yoo im here rn dawg chillingf")
        guard let uid = Auth.auth().currentUser?.uid else { return }
        guard let snapshot = try? await Firestore.firestore().collection("users").document(uid).getDocument() else {return}
        self.currentUser = try? snapshot.data(as: User.self)
        }

  
}
