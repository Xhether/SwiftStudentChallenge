//
//  AreaGoals.swift
//  SwiftStudentChallenge
//
//  Created by Charles Liggins on 1/13/24.
//

import SwiftUI

struct AreaGoals: View {
    let title: String
    @State var text = ""
    var body: some View {
        VStack{
            Text("Goals for \(title)")
                .font(.largeTitle)
                .padding(.leading, 30)
                .padding(.bottom, 30)
                .frame(maxWidth: .infinity, alignment: .leading)
                .bold()

            //For each goal, display it with these configs
            VStack(alignment: .leading, content: {
                HStack(content: {
                    TextField("Add a new Goal", text: $text)
                        .padding(.leading,40)
                        .font(.headline)
                    
                    //Post new Goal
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Image(systemName: "cursorarrow.click.2")
                            .padding(.trailing,48)
                        
                    })
                   
                    
                })
                    .background(
                        RoundedRectangle(cornerRadius: 12.0)
                            .fill(Color.white)
                            .stroke(.mint, lineWidth: 2)
                            .frame(width: 340,height: 44)
                    )

                //Sample set of Goals
                Text(" - Attend Every Lecture")
                    .padding()
                    .font(.headline)
                
                Text(" - Go to Office hours at least twice monthly")
                    .padding()
                    .font(.headline)
                
                Text(" - Form a consistent study group")
                    .padding()
                    .font(.headline)
                
                Text(" - Get an A")
                    .padding()
                    .font(.headline)
                
                Text(" - Start Homework as soon as it's assigned")
                    .padding()
                    .font(.headline)
                
                Text("")
                    .font(.headline)
            })
            
            //add section to see goals of friends???
            
            Spacer()
            
        }
    }
}

#Preview {
    AreaGoals(title: "Discrete Structures")
}
