//
//  ProfileView.swift
//  SwiftStudentChallenge
//
//  Created by Charles Liggins on 1/4/24.
//

import SwiftUI
import SDWebImageSwiftUI
import SDWebImage
import PhotosUI

struct ProfileView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    @State private var avatarItem: PhotosPickerItem?
    @State private var avatarImage: Image?
    
    var body: some View{
        if let user = viewModel.currentUser {
            NavigationStack{
                VStack {
                    HStack{
                        Text("Profile")
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
                        
                        NavigationLink {
                            SettingsView()
                        } label: {
                            Image(systemName: "gear")
                                .font(.system(size: 40, weight: .bold))
                        }
                        .padding(.trailing, 30)
                        .padding(.bottom, 20)
                        
                    }
                    
                    Text("Change Profile Picture")
                    
                    WebImage(url: URL(string: "https://media.licdn.com/dms/image/D4E03AQFwEL1N6pJsWg/profile-displayphoto-shrink_400_400/0/1690296458821?e=1709769600&v=beta&t=Lm9tzUuSU4aiCrrJKFYiLt0UkFmO4Leam_nFINghSA4"))
                        .resizable()
                        .scaledToFit()
                        .frame(width: 300, height: 300)
                        .clipShape(Circle())
                    
                    Text(user.fullname)
                        .font(.headline)
                    
                    Text("Logistics")
                        .font(.title2)
                        .padding(.leading, 30)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .bold()
                    
                    Divider()
                        .padding(.leading, 30)
                        .padding(.trailing, 30)
                        .padding(.bottom, 30)
                    
                    //                Text("You've completed \(logistics.onTimeTasksCompleted) tasks this month")
                    //
                    //                Text("You've completed \(logistics.lateTasksCompleted) tasks late this month")
                    //
                    //                Text("You have \(logistics.upcomingTasks) upcoming tasks this month")
                    
                    Spacer()
                    
                    Text("Friends")
                        .font(.title2)
                        .padding(.leading, 30)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .bold()
                    
                    Divider()
                        .padding(.leading, 30)
                        .padding(.trailing, 30)
                    
                    Spacer()
                }
            }
        }
    }
}


//#Preview {
//   ProfileView().environmentObject(LogisticsInfo())
//
//}
