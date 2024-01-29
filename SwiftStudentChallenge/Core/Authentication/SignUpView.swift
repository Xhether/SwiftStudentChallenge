//
//  SignUpView.swift
//  SwiftStudentChallenge
//
//  Created by Charles Liggins on 12/29/23.
//

import SwiftUI

struct SignUpView: View {
    @State private var name: String = ""
    @State private var school: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var viewModel: AuthViewModel

    var body: some View {
        NavigationStack{
            VStack {
                
                Text("SignUp")
                    .font(.largeTitle)
                    .padding(.leading, 30)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .bold()
                
                Spacer()
                
                Text("Name")
                    .padding(.leading, 30)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                TextField(
                    "Name",
                    text: $name
                )
                .frame(height: 64)
                .padding(.leading, 30)
                .background(
                    RoundedRectangle(cornerSize: CGSize(width: 4, height: 4))
                        .fill(Color.gray)
                )
                
                Text("School")
                    .padding(.top, 20)
                    .padding(.leading, 30)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                TextField(
                    "School",
                    text: $school
                )
                .frame(height: 64)
                .padding(.leading, 30)
                
                .background(
                    RoundedRectangle(cornerSize: CGSize(width: 4, height: 4))
                        .fill(Color.gray)
                )
                
                Text("Email")
                    .padding(.top, 20)
                    .padding(.leading, 30)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                TextField(
                    "Email",
                    text: $email
                )
                .frame(height: 64)
                .padding(.leading, 30)
                
                .background(
                    RoundedRectangle(cornerSize: CGSize(width: 4, height: 4))
                        .fill(Color.gray)
                )
                
                Text("Password")
                    .padding(.top, 20)
                    .padding(.leading, 30)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                TextField(
                    "Password",
                    text: $password
                )
                .frame(height: 64)
                .padding(.leading, 30)
                
                .background(
                    RoundedRectangle(cornerSize: CGSize(width: 4, height: 4))
                        .fill(Color.gray)
                )
                
                Text("Re-enter Password")
                    .padding(.top, 20)
                    .padding(.leading, 30)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                TextField(
                    "Password",
                    text: $confirmPassword
                )
                .frame(height: 64)
                .padding(.leading, 30)
                
                .background(
                    RoundedRectangle(cornerSize: CGSize(width: 4, height: 4))
                        .fill(Color.gray)
                )
                
                HStack{
                  
                    Button {
                        Task {
                            try await viewModel.createUser(
                                withEmail: email,
                                fullname: name,
                                password: password)
                        }
                    } label: {
                        HStack{
                            Text("Sign Up")
                                .fontWeight(.semibold)
                            Image(systemName: "arrow.right")
                        }
                        .foregroundColor(.white)
                        .frame(width: UIScreen.main.bounds.width/2 - 32, height: 48)
                    }
                    .background(Color(.systemBlue))
                    .cornerRadius(10.0)
                    
                }

                NavigationLink {
                    LoginView()
                        .navigationBarBackButtonHidden(true)
                } label: {
                    HStack(spacing: 3) {
                        Text("Have an account?")
                        Text("Log in")
                            .fontWeight(.bold)
                    }
                }
            
                
                Spacer()
                Spacer()
                
            }
        }
        .padding()
    }
}

#Preview {
    SignUpView()
}
