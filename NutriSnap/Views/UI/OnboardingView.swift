//
//  OnboardingView.swift
//  NutriSnap
//
//  Created by Michael Eko on 29/04/24.
//

import SwiftUI

struct OnboardingView: View {
    private let cornerRadius: CGFloat = 12
    private let containerPadding: CGFloat = 24
    private let headerFontSize: CGFloat = 18
    private let titleFontSize: CGFloat = 32
    @State private var step: Int = 1
    @State private var bodyWeight: String = ""
    @State private var bodyHeight: String = ""
    @State private var age: String = ""
    @State private var selectedActivity: Activity = .minimal
    @State private var selectedGoal: Goal = .loss
    @State private var isDisabled: Bool = false
    private let encoder: JSONEncoder = JSONEncoder()

    var body: some View {
        ZStack {
            VStack {
                if step == 1 {
                    IntroductionOnboarding()
                } else {
                    UserDataOnboarding(
                        bodyWeight: $bodyWeight,
                        bodyHeight: $bodyHeight,
                        age: $age,
                        selectedActivity: $selectedActivity,
                        selectedGoal: $selectedGoal
                    )
                }
                
                Spacer()
                Button(action: {
                    if step == 1 {
//                        isDisabled = true
                        step = 2
                    } else {
                        var user: User {
                            User(bodyHeight: Int(bodyHeight) ?? 0, bodyWeight: Int(bodyWeight) ?? 0, age: Int(age) ?? 0, activity: selectedActivity, goal: selectedGoal)
                        }
                        
                        do {
                            let data = try encoder.encode(user)
                            let json = String(data: data, encoding: String.Encoding.utf8)
                            UserDefaults.standard.set(json, forKey: "user")
                        } catch {
                            print("Error encoding user: \(error)")
                        }
                    }
                }) {
                    if step == 1 {
                        Text("Continue")
                            .font(.system(size: headerFontSize))
                            .bold()
                            .foregroundStyle(.white)
                            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                            .padding(.vertical, 16)
                    } else {
                        NavigationLink(destination: MainView()) {
                            Text("Get Started")
                                .font(.system(size: headerFontSize))
                                .bold()
                                .foregroundStyle(.white)
                                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                                .padding(.vertical, 16)
                        }
                    }
                }
                .background(isDisabled ? .gray : Color("BGNavyBlue"))
                .cornerRadius(cornerRadius)
//                .disabled(isDisabled)
            }
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity)
        }
        .padding(containerPadding)
        .background(Color("BGGray"))
    }
}

#Preview {
    OnboardingView()
}
