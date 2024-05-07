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
//                UserDataForm(
//                    bodyWeight: $bodyWeight,
//                    bodyHeight: $bodyHeight,
//                    age: $age,
//                    gender: $gender,
//                    selectedActivity: $selectedActivity,
//                    selectedGoal: $selectedGoal
//                )
                
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

struct ProgressBarHeightPreferenceKey: PreferenceKey {
    static var defaultValue: CGFloat = 0

    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}

struct DashboardView: View {
    @State private var isGoalSheetShow: Bool = false
    @State private var isAddData: Bool = false
    @State private var user: User?
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \Meal.created_at, ascending: false)]) private var meals: FetchedResults<Meal>
    
    private var totalCaloriesForToday: Int {
        let today = Calendar.current.startOfDay(for: Date())
        let tomorrow = Calendar.current.date(byAdding: .day, value: 1, to: today)!
        
        let mealsForToday = meals.filter { meal in
            if let mealDate = meal.created_at {
                return mealDate >= today && mealDate < tomorrow
            }
            return false
        }
        
        return mealsForToday.reduce(0) { total, meal in
            total + (Int(meal.calorie ?? "0") ?? 0)
        }
    }
    
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
                                ProgressView(value: Float(totalCaloriesForToday), total: Float(user?.upperThresholdCalorie ?? 0), label: {
                                    EmptyView()
                                }, currentValueLabel: {
                                    HStack(alignment: .bottom) {
                                        Text(String(totalCaloriesForToday))
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
                        CalorieProgressCard(user: $user, calorieLogged: totalCaloriesForToday)
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
                        if meals.count > 0 {
                            ForEach(meals, id: \.self) { meal in
                                NavigationLink {
                                    DetailMealView(meal: meal)
                                } label: {
                                    MealCard(mealName: meal.name!, image: meal.image!, calorie: meal.calorie ?? "")
                                }
                            }
                        } else {
                            HStack(alignment: .center) {
                                Text("Start tracking your meals! You haven't logged any yet.")
                                    .font(.system(size: 12))
                                    .fontWeight(.semibold)
                                    .foregroundStyle(.gray)
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
