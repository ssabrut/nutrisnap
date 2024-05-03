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
    @State private var gender: Gender = .male
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
                    gender: $gender,
                    selectedActivity: $selectedActivity,
                    selectedGoal: $selectedGoal
                )
                
                Button(action: {
                    print("a")
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
    }
}

struct DashboardView: View {
    @State private var isGoalSheetShow: Bool = false
    @State private var isAddData: Bool = false
    @State private var user: User?
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \Meal.created_at, ascending: false)]) private var meals: FetchedResults<Meal>
    
    var body: some View {
        NavigationView {
            ZStack {
                ScrollView {
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
                                ProgressView(value: 20, total: Float(user?.upperThresholdCalorie ?? 0), label: {
                                    EmptyView()
                                }, currentValueLabel: {
                                    HStack(alignment: .bottom) {
                                        Spacer()
                                        Text(String(user?.upperThresholdCalorie ?? 0))
                                    }
                                })
                                    .padding(.top, 24)
                            }
                            .padding(16)
                        }
                        .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 8, trailing: 0))
                        CalorieProgressCard(user: $user)
                        HStack {
                            Text("Meals")
                                .font(.system(size: 18))
                                .bold()
                            Spacer()
                            NavigationLink(destination: AddMealView(popToRoot: $isAddData), isActive: $isAddData) {
                                Text("+ Add Meal")
                                    .font(.system(size: 12))
                                    .bold()
                            }
                        }
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 8, trailing: 0))
                        ForEach(meals, id: \.self) { meal in
                            NavigationLink {
                                DetailMealView(meal: meal)
                            } label: {
                                MealCard(mealName: meal.name!, image: meal.image!, calorie: meal.calorie ?? "")
                            }
                        }
                        Spacer()
                    }
                }
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity)
            }
            .padding(.horizontal, 24)
            .background(Color("BGGray"))
            .navigationTitle("NutriSnap")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden()
        }
        .task {
            let decoder: JSONDecoder = JSONDecoder()
            let data = UserDefaults.standard.string(forKey: "user")!

            do {
                user = try decoder.decode(User.self, from: Data(data.utf8))
            } catch {
                print("Error decoding user \(error)")
            }
        }
    }
}

#Preview {
    DashboardView()
}
