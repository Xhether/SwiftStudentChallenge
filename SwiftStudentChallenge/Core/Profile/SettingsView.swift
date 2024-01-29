//
//  SettingsView.swift
//  SwiftStudentChallenge
//
//  Created by Charles Liggins on 1/4/24.
//

import SwiftUI
import SDWebImage
import SDWebImageSwiftUI

struct SettingsView: View {
    
    @State var toggle = true
    @State var mode = false
    
    @EnvironmentObject var viewModel: AuthViewModel
    var body: some View {
        if let user = viewModel.currentUser {
            NavigationStack{
                VStack{
                    Text("Settings")
                        .font(.largeTitle)
                        .padding(.leading, 30)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .bold()
                    
                    HStack{
                        WebImage(url: URL(string: "https://media.licdn.com/dms/image/D4E03AQFwEL1N6pJsWg/profile-displayphoto-shrink_400_400/0/1690296458821?e=1709769600&v=beta&t=Lm9tzUuSU4aiCrrJKFYiLt0UkFmO4Leam_nFINghSA4"))
                            .resizable()
                            .scaledToFit()
                            .frame(width: 64, height: 64)
                            .clipShape(Circle())
                            .padding(.leading, 48)
                        
                        VStack{
                            Text(user.fullname)
                            Text(user.email)
                        } .padding(.leading, 16)
                        
                        Image(systemName: "star")
                            .padding(.leading, 16)
                        
                        Spacer()
                        
                    }
                    
                    Divider()
                    
                    
                    
                    // Think about whether or not you want everyone to see all of your schedule configs
                    HStack{
                        Text("Groups")
                            .font(.headline)
                            .padding()
                            .padding(.leading, 48)
                        
                        Spacer()
                        
                        Text("Configure")
                            .font(.headline)
                            .padding()
                            .padding(.leading, 48)
                        
                        
                        Spacer()
                    }
                    
                    Divider()
                    
                    
                    HStack{
                        
                        VStack {
                            Toggle(isOn: $mode){
                                if mode {
                                    Text("Dark Mode")
                                        .font(.headline)
                                        .padding()
                                        .padding(.leading, 48)
                                } else {
                                    Text("Light Mode")
                                        .font(.headline)
                                        .padding()
                                        .padding(.leading, 48)
                                }
                            }
                            .padding(.trailing, 40)
                            .tint(.black)
                        }
                        
                        Spacer()
                    }
                    
                    Divider()
                    
                    HStack{
                        Text("Sign out")
                            .font(.headline)
                            .padding()
                            .padding(.leading, 48)
                        
                        Spacer()
                        
                        Image(systemName: "signpost.right")
                        
                        
                        Spacer()
                    }
                    
                    Divider()
                    
                    HStack{
                        Text("Delete Account")
                            .font(.headline)
                            .padding()
                            .padding(.leading, 48)
                        
                        Spacer()
                        
                        Image(systemName: "x.circle.fill")
                        
                        
                        Spacer()
                    }
                    
                    Spacer()
                }
                
                
            }
        }
    }
}

#Preview {
   SettingsView()
}

