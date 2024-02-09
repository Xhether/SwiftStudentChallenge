//
//  AreaSchedule.swift
//  SwiftStudentChallenge
//
//  Created by Charles Liggins on 1/13/24.
//

import SwiftUI

struct AreaSchedule: View {
    @State var selectedDate: Date = Date()
    var body: some View {
        
        VStack() {
            
            Text("Schedule for Discrete Structures")
                .font(.largeTitle)
                .padding(.leading, 30)
                .padding(.bottom, 30)
                .frame(maxWidth: .infinity, alignment: .leading)
                .bold()
            
            Text(selectedDate.formatted(date: .abbreviated, time: .omitted))
                .font(.system(size: 28))
                .bold()
                .foregroundColor(Color.accentColor)
                .padding()
                .animation(.spring(), value: selectedDate)
                .frame(width: 500)
            
            Divider().frame(height: 1)
            
            DatePicker("Select Date", selection: $selectedDate, displayedComponents: [.date])
                .padding(.horizontal)
                .datePickerStyle(.graphical)
            Divider()
        
            Spacer()
        }
    }
}

#Preview {
    AreaSchedule()
}
