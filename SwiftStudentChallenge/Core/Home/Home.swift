//
//  Home.swift
//  SwiftStudentChallenge
//
//  Created by Charles Liggins on 1/4/24.
//

import SwiftUI

struct Home: View {
    @StateObject var logistics = LogisticsInfo()
    @State private var showPopUp = false
    @State var areaColor = Color(.systemBackground)
    @State private var selection = "Courses"
    let areas = ["Courses", "Extracurriculars", "Research", "Content Creation"]
    
    var body: some View {
        NavigationStack{
            VStack {
                HStack{
                    
                    Text("Home")
                        .font(.largeTitle)
                        .padding(.leading, 30)
                        .padding(.bottom, 30)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .bold()
                    
                    NavigationLink {
                        SettingsView()
                        // .navigationBarBackButtonHidden(true)
                    } label: {
                        Image(systemName: "gear")
                            .font(.system(size: 50, weight: .bold))
                    }
                    .padding(.trailing, 30)
                    .padding(.bottom, 20)
                    
                }
                
                //
                ForEach(areas, id: \.self) { text in
                    AreaBubble(area: AreaModel(id: "12345", name: text), bgColor: Color.yellow)
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
                            
                            Text("Add Area")
                            
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
                                Text("Select Area")
                                    .padding(.leading,16)
                                Spacer()
                                Picker("Select an area", selection: $selection) {
                                    ForEach(areas, id: \.self) {
                                        Text($0)
                                    }
                                }
                            }
                                ColorPicker("Select Color", selection: $areaColor)
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
                    
                    
                    Spacer()
                    
                   
                }
            }
        }
    }


#Preview {
    Home()
}
