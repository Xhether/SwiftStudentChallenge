//
//  DetailedAreaView.swift
//  SwiftStudentChallenge
//
//  Created by Charles Liggins on 1/13/24.
//

import SwiftUI

struct DetailedAreaView: View {
    @State private var showPopToday = false
    @State var nestedAreaColor = Color(.systemBackground)
    @State private var topic: String = ""
    @State private var offset = CGSize.zero
    @StateObject var tasksManager = AuthViewModel()
    @State private var selection = "1"
    
    let priorities = ["1", "2", "3", "4"]

    let title: String
    
    var sampleTasks = ["Read Chapter 1 of Textbook", "Complete Lab Report #1", "Complete Syllabus Quiz", "Complete PSET #1", "Read 20 Pages of the Interpolation of Dreams"]
    
    var body: some View {
        NavigationStack{
            ScrollView(.vertical){
                VStack{
                    HStack{
                        Text(title)
                            .font(.largeTitle)
                            .padding(.leading, 30)
                            .padding(.bottom, 30)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .bold()
                    
                        NavigationLink {
                            Home()
                        } label: {
                            Image(systemName: "house")
                                .font(.system(size: 40, weight: .bold))
                        }
                        .padding(.trailing, 30)
                        .padding(.bottom, 20)
                        .navigationBarBackButtonHidden()
                    }
                    
                    //Go to area goals screen
                    HStack(alignment: .center){
                        NavigationLink{
                            AreaGoals(title: title)
                        } label: {
                            RoundedRectangle(cornerRadius: 8)
                                .frame(width: 150, height: 28)
                                .padding(.trailing,44)
                                .foregroundStyle(Color.gray)
                                .opacity(0.7)
                                .overlay(
                                    Text("View Goals")
                                        .padding(.trailing, 40)
                                        .foregroundStyle(Color.gray)
                                )
                                .padding(.leading,44)
                        }
                        
                        //Go to area schedule screen
                        NavigationLink{
                            AreaSchedule()
                        } label: {
                            RoundedRectangle(cornerRadius: 8)
                                .frame(width: 150, height: 28)
                                .padding(.trailing,44)
                                .foregroundStyle(Color.gray)
                                .opacity(0.7)
                                .overlay(
                                    Text("View Schedule")
                                        .padding(.trailing, 40)
                                        .foregroundStyle(Color.gray)
                                )
                        }
                    }
                    
                    Text("Today")
                        .font(.largeTitle)
                        .padding(.leading, 30)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .bold()
                    
                    Divider()
                        .frame(height: 2)
                        .overlay(.black)
                        .padding(.leading, 30)
                        .padding(.top, -20)
                        .padding(.trailing, 60)
                    
                    ForEach(tasksManager.tasks, id: \.self) { task in
                        if (task.areaUnder == title && isDateToday(task.dueDate)){
                            TasksBubble(task: task)
                        }
                    }
//                    .offset(CGSize(width: offset.width, height: 0))
//                    .gesture(
//                    DragGesture()
//                        .onChanged { gesture in
//                            offset = gesture.translation
//                        }.onEnded { _ in
//                            withAnimation {
//                                swipeTask(width: offset.width)
//                            }
//                        }
//                    )
                
                    //Activates popup
                    Button(action: {
                        self.showPopToday = true
                        
                    }, label: {
                        ZStack{
                            
                            RoundedRectangle(cornerRadius: 20)
                                .fill(Color.white)
                                .stroke(.mint, lineWidth: 2)
                                .frame(width: 300, height: 50)
                            
                            HStack{
                                Image(systemName: "plus.circle")
                                
                                Text("Add Task")
                                
                            }
                        }
                    })
                    
                    //Popup for creating a new area
                    if $showPopToday.wrappedValue {
                        ZStack {
                            Color.white
                            VStack {
                                
                                Text("New Area")
                                    .font(.headline)
                                    .padding(.bottom, 10)
                                HStack{
                                    Text("Type Name")
                                        .padding(.leading,16)
                                    
                                    Spacer()
                                    
                                    TextField("Name", text: $topic)
                                }
                                HStack{
                                    Text("Select Priority")
                                        .padding(.leading,16)
                                    
                                    Spacer()
                                    
                                    Picker("Priority", selection: $selection) {
                                        ForEach(priorities, id: \.self) {
                                            Text($0)
                                        }
                                    }
                                }
                                
                                Spacer()
                                
                                Button(action: {
                                    self.showPopToday = false
                                    tasksManager.makeTasks(name: topic, priority: Int(selection) ?? 1, dueDate: Date(), areaUnder: title)
                                }, label: {
                                    Text("Finish")
                                })
                            }.padding()
                        }
                        .pickerStyle(.menu)
                        .frame(width: 380, height: 200)
                        .cornerRadius(20).shadow(radius: 20)
                    }
                    
                    Text("Upcoming")
                        .font(.largeTitle)
                        .padding(.leading, 30)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .bold()
                    
                    Divider()
                        .frame(height: 2)
                        .overlay(.black)
                        .padding(.leading, 30)
                        .padding(.top, -20)
                        .padding(.trailing, 60)
                }
                Spacer()
            }
        }
    }
    
    //Function allowing swipe gesture for task, change to add deletion and completion...
    func swipeTask(width: CGFloat){
        switch width {
        case -500...(-300):
            offset = CGSize(width: -500, height: 0)
        case 300...500:
            print("task completed")
            offset = CGSize(width: 500, height: 0)
        default:
            offset = .zero
        }
    }
}

//Allows for filtering between dates
func isDateToday(_ date: Date) -> Bool {
        let calendar = Calendar.current
        return calendar.isDateInToday(date)
    }


func isDateFuture(_ date: Date) -> Bool {
        let calendar = Calendar.current
        let today = calendar.startOfDay(for: Date())
        let target = calendar.startOfDay(for: date)
        return today > target
    }

#Preview {
    DetailedAreaView(title: "DetailedAreaView")
}
