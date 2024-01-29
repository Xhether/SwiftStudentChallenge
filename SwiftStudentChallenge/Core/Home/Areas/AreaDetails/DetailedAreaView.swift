//
//  DetailedAreaView.swift
//  SwiftStudentChallenge
//
//  Created by Charles Liggins on 1/13/24.
//

import SwiftUI

struct DetailedAreaView: View {
    @State private var showPopUp = false
    @State var nestedAreaColor = Color(.systemBackground)
    @State private var topic: String = ""
    
    let title: String
    
    var sampleTasks = ["Read Chapter 1 of Textbook", "Complete Lab Report #1", "Complete Syllabus Quiz", "Complete PSET #1", "Read 20 Pages of the Interpolation of Dreams"]
    var areaArray = ["This", "Is", "Just", "A", "List", "Of", "Names"]
    
    
    
    var body: some View {
        NavigationStack{
        ScrollView(.vertical){
                VStack{
                    Text(title)
                        .font(.largeTitle)
                        .padding(.leading, 30)
                        .padding(.bottom, 30)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .bold()
                    
                    
                    
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
                    
                    ForEach(sampleTasks, id: \.self) { task in
                        TasksBubble(taskName: task, endTime: "11:00PM")
                    }
                    
                    
                    
                    Button(action: {
                        self.showPopUp = true
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
                    
                    Button(action: {
                        self.showPopUp = true
                    }, label: {
                        ZStack{
                            
                            RoundedRectangle(cornerRadius: 20)
                                .fill(Color.white)
                                .stroke(.mint, lineWidth: 2)
                                .frame(width: 300, height: 50)
                            
                            HStack{
                                Image(systemName: "plus.circle")
                                
                                Text("Add Upcoming Task")
                                
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
    }
}

#Preview {
    DetailedAreaView(title: "DetailedAreaView")
}
