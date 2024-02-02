//
//  TinyTasksBubble.swift
//  SwiftStudentChallenge
//
//  Created by Charles Liggins on 1/20/24.
//

import SwiftUI

struct TinyTasksBubble: View {
    var task: TasksModel
    
    var body: some View {
        VStack{
            
            //filtering by priority
            if task.priority == 0{
                RoundedRectangle(cornerRadius: 8.0)
                    .fill(Color.white)
                    .stroke(.black, lineWidth: 2)
                    .frame(width: 280,height: 20)
                    .overlay(
                        Text("\(task.name) - 11:59 PM")
                            .font(.caption)
                        )
            }
            if task.priority == 1{
                RoundedRectangle(cornerRadius: 8.0)
                    .fill(Color.red)
                    .stroke(.black, lineWidth: 2)
                    .frame(width: 280,height: 20)
                    .overlay(
                        Text("\(task.name) - 11:59 PM")
                            .font(.caption)
                        )
            }
            if task.priority == 2{
                RoundedRectangle(cornerRadius: 8.0)
                    .fill(Color.orange)
                    .stroke(.black, lineWidth: 2)
                    .frame(width: 280,height: 20)
                    .overlay(
                        Text("\(task.name) - 11:59 PM")
                            .font(.caption)
                        )
            } 
            if task.priority == 3{
                RoundedRectangle(cornerRadius: 8.0)
                    .fill(Color.yellow)
                    .stroke(.black, lineWidth: 2)
                    .frame(width: 280,height: 20)
                    .overlay(
                        Text("\(task.name) - 11:59 PM")
                            .font(.caption)
                        )
            } 
            if task.priority == 4{
                RoundedRectangle(cornerRadius: 8.0)
                    .fill(Color.blue)
                    .stroke(.black, lineWidth: 2)
                    .frame(width: 280,height: 20)
                    .overlay(
                        Text("\(task.name) - 11:59 PM")
                            .font(.caption)
                        )
            }
        }
    }
}


//#Preview {
//    TinyTasksBubble(task: TasksModel(id: UUID().uuidString, dueDate: Date.now, priority: 1, name: "Complete Monday Reading"))
//}
