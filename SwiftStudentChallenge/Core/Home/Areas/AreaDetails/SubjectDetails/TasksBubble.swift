//
//  TasksBubble.swift
//  SwiftStudentChallenge
//
//  Created by Charles Liggins on 1/22/24.
//

import SwiftUI

struct TasksBubble: View {
    let taskName: String
    let endTime: String
    
    var body: some View {
        HStack{
            
            
            Text(taskName)
                .font(.headline)
                .fontWeight(.bold)
                .frame(width: 188)
            
            Divider()
                .frame(width: 2, height: 72)
                .overlay(.black)
            
            Text(endTime)
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
            .opacity(0.4)
        )
    }
}
#Preview {
    TasksBubble(taskName: "Read Chapter 1 of Textbook", endTime: "8:00 PM")
}
