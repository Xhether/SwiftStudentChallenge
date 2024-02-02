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
    @StateObject var subAreasManager = AuthViewModel()
    @State private var topic: String = ""
    
    let subjects = ["Discrete Structures", "Multivariable Calculus for Engineers", "FWS: Marx, Nietzsche, Freud", "Physics Mechanics and Heat"]
    let title: String
    
    var body: some View{
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
//              display areas
            
            ForEach(subAreasManager.subAreas, id: \.self)  { subject in
                if (subject.areaUnder == title){
                    SubjectBubble(
                        subArea: subject,
                        tasks: [],
                        bgColor: Color.fromString(subject.colorStr)
                    )
                    .padding(.bottom, 12)
                }
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
                    Text("New Subject")
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
                        subAreasManager.makeSubArea(name: topic, color: nestedAreaColor, areaUnder: title)
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
