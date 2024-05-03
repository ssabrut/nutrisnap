//
//  DashboardView.swift
//  NutriSnap
//
//  Created by Michael Eko on 02/05/24.
//

import SwiftUI

struct SheetView: View {
    private let headerFontSize: CGFloat = 18
    private let cornerRadius: CGFloat = 12
    @Environment(\.dismiss) var dismiss
    @State private var bodyWeight: String = ""
    @State private var bodyHeight: String = ""
    @State private var age: String = ""
    @State private var selectedActivity: Activity = .minimal
    @State private var selectedGoal: Goal = .loss
    @State private var isLoading: Bool = true
    
    var body: some View {
        VStack(alignment: .leading) {
            Button(action: {
                dismiss()
            }) {
                Text("Dismiss")
            }
            
            if !self.isLoading {
                UserDataForm(
                    bodyWeight: $bodyWeight,
                    bodyHeight: $bodyHeight,
                    age: $age,
                    selectedActivity: $selectedActivity,
                    selectedGoal: $selectedGoal
                )
                
                Button(action: {
                    var user: User {
                        User(bodyHeight: bodyHeight, bodyWeight: bodyWeight, age: age, activity: selectedActivity, goal: selectedGoal)
                    }
                    
                    do {
                        let encoder: JSONEncoder = JSONEncoder()
                        let data = try encoder.encode(user)
                        let json = String(data: data, encoding: String.Encoding.utf8)!
                        UserDefaults.standard.set(json, forKey: "user")
                        dismiss()
                    } catch {
                        print("Error encoding user: \(error)")
                    }
                }) {
                    Text("Update")
                        .font(.system(size: headerFontSize))
                        .bold()
                        .foregroundStyle(.white)
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                        .padding(.vertical, 16)
                }
                .background(Color("BGNavyBlue"))
                .cornerRadius(cornerRadius)
            }
        }
        .padding(24)
        .background(Color("BGGray"))
        .task {
            let decoder: JSONDecoder = JSONDecoder()
            let data = UserDefaults.standard.string(forKey: "user")!
            
            do {
                let user = try decoder.decode(User.self, from: Data(data.utf8))
                self.bodyWeight = user.bodyWeight
                self.bodyHeight = user.bodyHeight
                self.age = user.age
                self.selectedActivity = user.activity
                self.selectedGoal = user.goal
                self.isLoading = false
            } catch {
                print("Error decoding user \(error)")
            }
        }
    }
}

struct DashboardView: View {
    @State private var isGoalSheetShow: Bool = false
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack(alignment: .leading) {
                    HStack {
                        Text("Today")
                            .font(.system(size: 18))
                            .fontWeight(.bold)
                        Spacer()
                    }
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 8, trailing: 0))
                    ZStack(alignment: .leading) {
                        RoundedRectangle(cornerRadius: 12)
                            .fill(.white)
                        VStack(alignment: .leading) {
                            Text("Calories Intake")
                                .font(.system(size: 18))
                                .bold()
                                .padding(EdgeInsets(top: 0, leading: 0, bottom: 2, trailing: 0))
                            Text("Remaining = Goal - Food")
                                .font(.system(size: 12))
                                .fontWeight(.semibold)
                                .foregroundStyle(.gray)
                        }
                        .padding(16)
                    }
                    .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 8, trailing: 0))
                    CalorieProgressCard()
                    HStack {
                        Text("Meals")
                            .font(.system(size: 18))
                            .bold()
                        Spacer()
                        NavigationLink(destination: AddMealView()) {
                            Text("+ Add Meal")
                                .font(.system(size: 12))
                                .bold()
                        }
                    }
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 8, trailing: 0))
                    MealCard()
                    Spacer()
                }
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity)
            }
            .padding(.horizontal, 24)
            .background(Color("BGGray"))
            .navigationTitle("NutriSnap")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden()
        }
    }
}

#Preview {
    DashboardView()
}
