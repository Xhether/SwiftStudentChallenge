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
    @StateObject var areasManager = AuthViewModel()
    @State var areaColor = Color(.systemBackground)
    @State private var selection = "Courses"
    
    let areas = ["Courses", "Extracurriculars", "Research", "Content Creation"]
    
    var body: some View {
        NavigationStack{
            ScrollView(.vertical){
                VStack {
                    //header
                    HStack{
                        
                        Text("Home")
                            .font(.largeTitle)
                            .padding(.leading, 30)
                            .padding(.bottom, 30)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .bold()
                        
                        NavigationLink {
                            ProfileView()
                        } label: {
                            Image(systemName: "brain.head.profile")
                                .font(.system(size: 40, weight: .bold))
                                .foregroundStyle(Color.pink)
                        }
                        .padding(.trailing, 30)
                        .padding(.bottom, 20)
                        .navigationBarBackButtonHidden()
                        
                        NavigationLink {
                            SettingsView()
                        } label: {
                            Image(systemName: "gear")
                                .font(.system(size: 40, weight: .bold))
                        }
                        .padding(.trailing, 30)
                        .padding(.bottom, 20)
                        
                    }
                    
                    //popup
                    if $showPopUp.wrappedValue {
                        ZStack (alignment: .center){
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
                                    areasManager.makeArea(name: selection, color: areaColor)
                                }, label: {
                                    Text("Finish")
                                })
                            }.padding()
                        }
                        
                        .pickerStyle(.menu)
                        .frame(width: 380, height: 200)
                        .cornerRadius(20).shadow(radius: 20)
                    }
                    
                    
                    ForEach(areasManager.areas, id: \.self) { area in
                        AreaBubble(area: area, bgColor: Color.fromString(area.colorStr))
                    }
                    
                    //popup
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
                }
                    Spacer()
                }
            }
        }
    }


#Preview {
    Home()
}
