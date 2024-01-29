//
//  TasksModel.swift
//  SwiftStudentChallenge
//
//  Created by Charles Liggins on 1/8/24.
//

import Foundation

struct TasksModel: Identifiable, Codable, Hashable {
    var id: UUID
    var dueDate: Date
    var priority: Int
    var name: String
    
}
