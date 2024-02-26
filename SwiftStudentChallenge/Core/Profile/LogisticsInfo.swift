//
//  LogisticsInfo.swift
//  SwiftStudentChallenge
//
//  Created by Charles Liggins on 1/6/24.
//

import SwiftUI


class LogisticsInfo: ObservableObject, Observable {
    @Published var onTimeTasksCompleted = 0
    @Published var lateTasksCompleted = 0
    @Published var upcomingTasks = 0 
    
    init(onTimeTasksCompleted: Int = 0, lateTasksCompleted: Int = 0, upcomingTasks: Int = 0) {
        self.onTimeTasksCompleted = onTimeTasksCompleted
        self.lateTasksCompleted = lateTasksCompleted
        self.upcomingTasks = upcomingTasks
    }
}
