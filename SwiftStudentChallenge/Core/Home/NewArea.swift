//
//  NewArea.swift
//  SwiftStudentChallenge
//
//  Created by Charles Liggins on 1/6/24.
//

import SwiftUI

struct NewArea: View {
    let type: String
    let color: Color

    
    var body: some View{
        NavigationStack{
            NavigationLink{
                AreasView()
            } label: {
                ZStack{
                    
                    RoundedRectangle(cornerRadius: 20)
                                    .fill(color)
                                    .stroke(.mint, lineWidth: 2)
                                    .frame(width: 300, height: 100)
                    
                    HStack{
                        Text(type)
                    }
                }
            }
        }
    }
}

//#Preview {
//   // NewArea(type: "Placeholder")
//}
