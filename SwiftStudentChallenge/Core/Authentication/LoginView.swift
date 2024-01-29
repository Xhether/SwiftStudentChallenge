//
//  LoginView.swift
//  SwiftStudentChallenge
//
//  Created by Charles Liggins on 12/29/23.
//

import SwiftUI

struct LoginView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @EnvironmentObject var viewModel: AuthViewModel

    var body: some View {
        NavigationStack{
            VStack {
                
                Text("Login")
                    .font(.largeTitle)
                    .padding(.leading, 30)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .bold()
                
                Spacer()
                
                Text("Email")
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
                HStack{
                    //Log in button
                    Button {
                        Task {try await viewModel.signIn(withEmail: email, password: password)
                        }
                    } label: {
                        HStack{
                            Text("Log in")
                                .fontWeight(.semibold)
                            Image(systemName: "arrow.right")
                        }
                        .foregroundColor(.white)
                        .frame(width: UIScreen.main.bounds.width/2 - 32, height: 48)
                    }
                    .background(Color(.systemBlue))
                    .cornerRadius(10.0)
                    
                }
                Spacer()
                
                // sign up button
                
                NavigationLink {
                    SignUpView()
                        .navigationBarBackButtonHidden(true)
                } label: {
                    HStack(spacing: 3) {
                        Text("Don't have an account?")
                        Text("Sign Up")
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
    LoginView()
}
