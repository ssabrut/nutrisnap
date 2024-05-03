//
//  CalculateView.swift
//  NutriSnap
//
//  Created by Michael Eko on 02/05/24.
//

import SwiftUI

struct CalculateView: View {
    @State private var numberOfDots: Int = 0
    @State var isActive: Bool = false
    @Binding var bodyWeight: String
    @Binding var bodyHeight: String
    @Binding var age: String
    @Binding var gender: Gender
    @Binding var selectedActivity: Activity
    @Binding var selectedGoal: Goal
    @State private var bmi: Float = 0.0
    @State private var bottomThresholdCalorie: Int = 0
    @State private var upperThresholdCalorie: Int = 0
    @State private var isRedirecting: Bool = false
    
    var body: some View {
        ZStack(alignment: .center) {
            RadialGradient(
                gradient: Gradient(colors: [.white, Color("BGCyan")]),
                center: .center,
                startRadius: 0,
                endRadius: 256
            )
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .ignoresSafeArea()
            
            NavigationLink(destination: MainView(), isActive: $isActive) {
                EmptyView()
            }
            
            VStack(alignment: .center) {
                FoodLoader()
                Text("Calculating" + String(repeating: ".", count: numberOfDots))
                    .font(.system(size: 14))
                    .bold()
            }
            .onAppear {
                Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
                    numberOfDots = (numberOfDots + 1) % 4
                }
            }
            .navigationBarBackButtonHidden()
        }
        .task {
            guard let weight = Int(bodyWeight), let height = Int(bodyHeight), let age = Int(age) else {
                return
            }

            let weightPart = 10 * weight
            let heightPart = 6.25 * Double(height)
            let agePart = 5 * age

            bmi = gender == .male ? Float(weightPart + Int(heightPart) - agePart + 5) : Float(weightPart + Int(heightPart) - agePart - 161)
            
            bottomThresholdCalorie = calculateThresholdCalorie(weight: weight, goal: selectedGoal, activity: selectedActivity, isLower: true)
            upperThresholdCalorie = calculateThresholdCalorie(weight: weight, goal: selectedGoal, activity: selectedActivity, isLower: false)
            
            var user: User {
                User(
                    bodyHeight: height,
                    bodyWeight: weight,
                    age: age,
                    gender: gender,
                    activity: selectedActivity,
                    goal: selectedGoal,
                    bmi: bmi,
                    bottomThresholdCalorie: bottomThresholdCalorie,
                    upperThresholdCalorie: upperThresholdCalorie
                )
            }

            do {
                let encoder: JSONEncoder = JSONEncoder()
                let data = try encoder.encode(user)
                let json = String(data: data, encoding: String.Encoding.utf8)!
                UserDefaults.standard.set(json, forKey: "user")
            } catch {
                print("Error encoding user: \(error)")
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                withAnimation {
                    self.isActive = true
                }
            }
        }
    }
}

private func calculateThresholdCalorie(weight: Int, goal: Goal, activity: Activity, isLower: Bool) -> Int {
    let calorieDictionary: [Activity:[Goal:[Int]]] = [
        .minimal: [
            .loss: [10, 12],
            .maintenance: [12, 14],
            .gain: [16, 18]
        ],
        .moderate: [
            .loss: [12, 14],
            .maintenance: [14, 16],
            .gain: [18, 20]
        ],
        .active: [
            .loss: [14, 16],
            .maintenance: [16, 18],
            .gain: [20, 22]
        ]
    ]
    
    return weight * calorieDictionary[activity]![goal]![isLower ? 0 : 1]
}

//#Preview {
//    CalculateView()
//}
