//
//  LogisticsInfo.swift
//  SwiftStudentChallenge
//
//  Created by Charles Liggins on 1/6/24.
//

import SwiftUI

class LogisticsInfo: ObservableObject {
    @Published var onTimeTasksCompleted = 0
    @Published var lateTasksCompleted = 0
    @Published var upcomingTasks = 0 
}
