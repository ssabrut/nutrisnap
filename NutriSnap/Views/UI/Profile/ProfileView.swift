//
//  ProfileView.swift
//  NutriSnap
//
//  Created by Michael Eko on 02/05/24.
//

import SwiftUI

struct ProfileView: View {
    @State var bodyWeight: String = ""
    @State var bodyHeight: String = ""
    @State var age: String = ""
    @State var gender: Gender = .male
    @State var selectedActivity: Activity = .minimal
    @State var selectedGoal: Goal = .loss
    @State private var isCalculating: Bool = false
    
    var body: some View {
        NavigationView { 
            ZStack {
                VStack {
                    UserDataForm(
                        bodyWeight: $bodyWeight,
                        bodyHeight: $bodyHeight,
                        age: $age,
                        gender: $gender,
                        selectedActivity: $selectedActivity,
                        selectedGoal: $selectedGoal
                    )
                    Spacer()
                    NavigationLink(destination: CalculateView(
                        bodyWeight: $bodyWeight,
                        bodyHeight: $bodyHeight,
                        age: $age,
                        gender: $gender,
                        selectedActivity: $selectedActivity,
                        selectedGoal: $selectedGoal
                    ), isActive: $isCalculating) {
                        EmptyView()
                    }
                    
                    Button(action: {
                        isCalculating.toggle()
                    }) {
                        Text("Update")
                            .font(.system(size: 18))
                            .bold()
                            .foregroundStyle(.white)
                            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                            .padding(.vertical, 16)
                    }
                    .background(Color("BGNavyBlue"))
                    .cornerRadius(12)
                }
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity)
                .onTapGesture {
                    hideKeyboard()
                }
            }
            .padding(EdgeInsets(top: 0, leading: 24, bottom: 24, trailing: 24))
            .background(Color("BGGray"))
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden()
        }
        .task {
            let decoder: JSONDecoder = JSONDecoder()
            let data = UserDefaults.standard.string(forKey: "user")!

            do {
                let user = try decoder.decode(User.self, from: Data(data.utf8))
                self.bodyWeight = String(user.bodyWeight)
                self.bodyHeight = String(user.bodyHeight)
                self.age = String(user.age)
                self.gender = user.gender
                self.selectedActivity = user.activity
                self.selectedGoal = user.goal
            } catch {
                print("Error decoding user \(error)")
            }
        }
    }
}

//#Preview {
//    ProfileView()
//}
