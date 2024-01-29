//
//  AreasView.swift
//  SwiftStudentChallenge
//
//  Created by Charles Liggins on 1/13/24.
//

import SwiftUI

struct AreasView: View {
    @State private var showPopUp = false
    @State var nestedAreaColor = Color(.systemBackground)
    @State private var topic: String = ""
    
    let subjects = ["Discrete Structures", "Multivariable Calculus for Engineers", "FWS: Marx, Nietzsche, Freud", "Physics Mechanics and Heat"]
    let title: String
    
    
    
    var body: some View{
        VStack{
            Text(title)
                .font(.largeTitle)
                .padding(.leading, 30)
                .padding(.bottom, 30)
                .frame(maxWidth: .infinity, alignment: .leading)
                .bold()
        
        //display areas 
            
            ForEach(subjects, id: \.self)  { subject in
                SubjectBubble(
                    area: AreaModel(id: "12345", name: subject),
                    tasks:
                    [TasksModel(id: UUID(), dueDate: Date.now, priority: 1, name: "Test"),
                    TasksModel(id: UUID(), dueDate: Date.now, priority: 3, name: "Syllabus")],
                    bgColor: Color.indigo
                )
            }
        
        Button(action: {
            self.showPopUp = true
        }, label: {
            ZStack{
                
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.white)
                    .stroke(.mint, lineWidth: 2)
                    .frame(width: 300, height: 100)
                
                HStack{
                    Image(systemName: "plus.circle")
                    
                    Text("Add Subject")
                    
                }
            }
        })
        
        if $showPopUp.wrappedValue {
            ZStack {
                Color.white
                VStack {
                    
                    Text("New Area")
                        .font(.headline)
                        .padding(.bottom, 10)
                    HStack{
                        Text("Select Topic")
                            .padding(.leading,16)
                        
                        Spacer()
                        
                        TextField("Topic", text: $topic)
                    }
                    ColorPicker("Select Color", selection: $nestedAreaColor)
                        .padding()
                    
                    Spacer()
                    
                    Button(action: {
                        self.showPopUp = false
                        //post request to post a new area
                    }, label: {
                        Text("Finish")
                    })
                }.padding()
            }
            .pickerStyle(.menu)
            .frame(width: 380, height: 200)
            .cornerRadius(20).shadow(radius: 20)
            }
        }
        Spacer()
    }
}


#Preview {
    AreasView(title: "AreasView")
}
