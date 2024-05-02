//
//  DashboardView.swift
//  NutriSnap
//
//  Created by Michael Eko on 02/05/24.
//

import SwiftUI

struct SheetView: View {
    @Environment(\.dismiss) var dismiss
    @State var bodyWeight: String = ""
    @State var bodyHeight: String = ""
    @State var age: String = ""
    @State var selectedActivity: Activity = .minimal
    @State var selectedGoal: Goal = .loss
    
    init() {
        let decoder: JSONDecoder = JSONDecoder()
        let data = UserDefaults.standard.string(forKey: "user")!
        
        do {
            let user = try decoder.decode(User.self, from: Data(data.utf8))
            self.bodyWeight = String(user.bodyWeight)
            self.bodyHeight = String(user.bodyHeight)
            self.age = String(user.age)
            self.selectedActivity = user.activity
            self.selectedGoal = user.goal
        } catch {
            print("Error decoding user \(error)")
        }
    }
    
    var body: some View {
        Button(action: {
            dismiss()
        }) {
            Text("Dismiss")
        }
        
        UserDataForm(
            bodyWeight: $bodyWeight,
            bodyHeight: $bodyHeight,
            age: $age,
            selectedActivity: $selectedActivity,
            selectedGoal: $selectedGoal
        )
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
                        Button(action: {
                            isGoalSheetShow = true
                        }) {
                            Text("Edit Goals")
                                .font(.system(size: 12))
                                .fontWeight(.semibold)
                        }
                        .sheet(isPresented: $isGoalSheetShow) {
                            SheetView()
                        }
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
                        Text("Recent Meals")
                            .font(.system(size: 18))
                            .bold()
                        Spacer()
                        Button(action: {
                            print("a")
                        }) {
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
            .padding(EdgeInsets(top: 0, leading: 24, bottom: 0, trailing: 24))
        .background(Color("BGGray"))
        }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    DashboardView()
}
