//
//  AreaBubble.swift
//  SwiftStudentChallenge
//
//  Created by Charles Liggins on 1/20/24.
//

import SwiftUI

struct AreaBubble: View {
    var area: AreaModel
    var bgColor: Color
    
    var body: some View {
        NavigationStack{
            VStack{
                NavigationLink{
                    AreasView(title: area.name)
                } label: {
                    ZStack{
                        
                        RoundedRectangle(cornerRadius: 20)
                            .fill(bgColor)
                            .stroke(.black, lineWidth: 2)
                            .frame(width: 300, height: 100)
                     
                        Text(area.name)
                            .foregroundStyle(Color.black)
                            .font(.headline)
                    }
                }
            }
        }
    }
}

#Preview {
    AreaBubble(area: AreaModel(id: "12345", name: "CS 2800"), bgColor: Color(red: 0.4627, green: 0.8392, blue: 1.0))
}


