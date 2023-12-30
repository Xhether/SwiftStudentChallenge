//
//  LoginView.swift
//  SwiftStudentChallenge
//
//  Created by Charles Liggins on 12/29/23.
//

import SwiftUI

struct LoginView: View {
    @State private var username: String = ""
    @State private var password: String = ""

    var body: some View {
        NavigationStack{
            VStack {
                
                Text("Login")
                    .font(.largeTitle)
                    .padding(.leading, 30)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .bold()
                
                Spacer()
                
                Text("Username")
                    .padding(.leading, 30)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                TextField(
                    "Username",
                    text: $username
                )
                .frame(height: 80)
                .padding(.leading, 30)
                .background(
                    RoundedRectangle(cornerSize: CGSize(width: 4, height: 4))
                        .fill(Color.gray)
                )
                
                Text("Password")
                    .padding(.top, 40)
                    .padding(.leading, 30)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                TextField(
                    "Password",
                    text: $password
                )
                .frame(height: 80)
                .padding(.leading, 30)
                
                .background(
                    RoundedRectangle(cornerSize: CGSize(width: 4, height: 4))
                        .fill(Color.gray)
                )
                
                
                Spacer()
                Spacer()
                
            }
        }
        .padding()
    }
}

#Preview {
    LoginView()
}
