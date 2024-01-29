//
//  SubjectBubble.swift
//  SwiftStudentChallenge
//
//  Created by Charles Liggins on 1/20/24.
//

import SwiftUI

struct SubjectBubble: View {
    var area: AreaModel
    var tasks: [TasksModel]
    var bgColor: Color
    
    var body: some View {
        NavigationStack{
            
            VStack{
                
                    NavigationLink{
                        DetailedAreaView(title: area.name)
                    } label: {
                        VStack{
                            Text(area.name)
                                .padding(.top,2)
                                .font(.headline)
                                .foregroundStyle(Color.black)

                            
                            Divider()
                                .frame(height: 2)
                                .overlay(.black)
                                .padding(.leading, 60)
                                .padding(.trailing, 60)
                            
                            ForEach(tasks, id: \.self) { task in
                                TinyTasksBubble(task: task)
                                    .foregroundStyle(Color.black)
                              }
                        }
                        .background(
                        RoundedRectangle(cornerRadius: 20)
                            .fill(bgColor)
                            .stroke(.black, lineWidth: 2)
                            .frame(width: 300, height: 100)
                            .foregroundStyle(Color.black)
                            .font(.headline)
                        )
                    }
                }
            }
        }
    }

#Preview {
    SubjectBubble(area: AreaModel(id: "12345", name: "Basic Engineering Statistics"),
                  tasks: [
                    TasksModel(id: UUID(), dueDate: Date.now, priority: 1, name: "Test"),
                    TasksModel(id: UUID(), dueDate: Date.now, priority: 3, name: "Syllabus")]
                  , bgColor: Color(red: 0.4627, green: 0.8392, blue: 1.0))
}

