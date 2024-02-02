//
//  TasksBubble.swift
//  SwiftStudentChallenge
//
//  Created by Charles Liggins on 1/22/24.
//

import SwiftUI

struct TasksBubble: View {
    var task: TasksModel
    
    var body: some View {
        if (task.priority == 1){
            HStack{
                Text(task.name)
                    .font(.headline)
                    .fontWeight(.bold)
                    .frame(width: 188)
                
                Divider()
                    .frame(width: 2, height: 72)
                    .overlay(.black)
                
                Text("11:59 PM")
                    .font(.headline)
                    .fontWeight(.bold)
                    .padding(.trailing,20)
            }
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.blue)
                    .stroke(.black, lineWidth: 2)
                    .frame(width: 300, height: 72)
                    .foregroundStyle(Color.black)
                    .font(.headline)
                    .opacity(0.8)
            )
        }
        
        if (task.priority == 2){
            HStack{
                Text(task.name)
                    .font(.headline)
                    .fontWeight(.bold)
                    .frame(width: 188)
                
                Divider()
                    .frame(width: 2, height: 72)
                    .overlay(.black)
                
                Text("11:59 PM")
                    .font(.headline)
                    .fontWeight(.bold)
                    .padding(.trailing,20)
            }
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.yellow)
                    .stroke(.black, lineWidth: 2)
                    .frame(width: 300, height: 72)
                    .foregroundStyle(Color.black)
                    .font(.headline)
                    .opacity(0.8)
            )
        }
        
        if (task.priority == 3){
            HStack{
                Text(task.name)
                    .font(.headline)
                    .fontWeight(.bold)
                    .frame(width: 188)
                
                Divider()
                    .frame(width: 2, height: 72)
                    .overlay(.black)
                
                Text("11:59 PM")
                    .font(.headline)
                    .fontWeight(.bold)
                    .padding(.trailing,20)
            }
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.orange)
                    .stroke(.black, lineWidth: 2)
                    .frame(width: 300, height: 72)
                    .foregroundStyle(Color.black)
                    .font(.headline)
                    .opacity(0.8)
            )
        }
        
        if (task.priority == 4){
            HStack{
                Text(task.name)
                    .font(.headline)
                    .fontWeight(.bold)
                    .frame(width: 188)
                
                Divider()
                    .frame(width: 2, height: 72)
                    .overlay(.black)
                
                Text("11:59 PM")
                    .font(.headline)
                    .fontWeight(.bold)
                    .padding(.trailing,20)
            }
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.red)
                    .stroke(.black, lineWidth: 2)
                    .frame(width: 300, height: 72)
                    .foregroundStyle(Color.black)
                    .font(.headline)
                    .opacity(0.8)
            )
        }
        
    }
}

//#Preview {
//    TasksBubble(taskName: "Read Chapter 1 of Textbook", endTime: "8:00 PM")
//}
