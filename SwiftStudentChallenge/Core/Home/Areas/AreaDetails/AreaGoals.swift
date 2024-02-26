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
    @StateObject var goalsManager = AuthViewModel()
    
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
                    Button {
                        goalsManager.makeGoal(name: text, areaUnder: title)
                    } label: {
                        Image(systemName: "cursorarrow.click.2")
                            .padding(.trailing,48)
                        
                    }
                    })
                })
                    .background(
                        RoundedRectangle(cornerRadius: 12.0)
                            .fill(Color.white)
                            .stroke(.mint, lineWidth: 2)
                            .frame(width: 340,height: 44)
                    )

                //All Goals
                ForEach(goalsManager.goals, id: \.self) { goal in
                    if (goal.areaUnder == title){
                        HStack{
                            Image(systemName: "pencil")
                            Text(goal.name)
                                .font(.headline)
                            Image(systemName: "x.circle")
                        }
                        .padding(.top)
                    }
                }
                
            
            
            //add section to see goals of friends???
            
            Spacer()
            
        }
    }
}

#Preview {
    AreaGoals(title: "Discrete Structures")
}
