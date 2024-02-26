//
//  ContentView.swift
//  SwiftStudentChallenge
//
//  Created by Charles Liggins on 12/20/23.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    @StateObject var logistics = LogisticsInfo()
    
    var body: some View {
        Group {
            if viewModel.userSession != nil {
                
                ProfileView()
                    .environment(logistics)
            } else {
                LoginView()
            }
        }
        
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View{
//        ContentView()
//    }
//}
