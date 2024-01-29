//
//  User.swift
//  SwiftStudentChallenge
//
//  Created by Charles Liggins on 1/4/24.
//

import Foundation

struct User: Identifiable, Codable {
    let id: String
    let fullname: String
    let email: String
    
    //config with default settings and such

    var initials: String {
        let formatter = PersonNameComponentsFormatter()
        if let components = formatter.personNameComponents(from: fullname) {
            formatter.style = .abbreviated
            return formatter.string(from: components)
        }
        return ""
    }
}

extension User {
    static var MOCK_User = User(id: NSUUID().uuidString, fullname: "Charles Liggins", email: "test@gmail.com")
}
