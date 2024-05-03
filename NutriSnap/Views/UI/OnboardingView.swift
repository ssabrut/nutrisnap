//
//  OnboardingView.swift
//  NutriSnap
//
//  Created by Michael Eko on 29/04/24.
//

import SwiftUI

extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(
            #selector(UIResponder.resignFirstResponder),
            to: nil,
            from: nil,
            for: nil
        )
    }
}

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
    @State private var isDataAvailable: Bool = false
    
    var body: some View {
        NavigationView {
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
                    
                    NavigationLink(destination: CalculateView(), isActive: $isDataAvailable) {
                        EmptyView()
                    }
                    
                    Button(action: {
                        if step == 1 {
                            step = 2
                        } else {
                            var user: User {
                                User(bodyHeight: bodyHeight, bodyWeight: bodyWeight, age: age, activity: selectedActivity, goal: selectedGoal)
                            }
                            
                            do {
                                let encoder: JSONEncoder = JSONEncoder()
                                let data = try encoder.encode(user)
                                let json = String(data: data, encoding: String.Encoding.utf8)!
                                UserDefaults.standard.set(json, forKey: "user")
                                isDataAvailable = true
                            } catch {
                                print("Error encoding user: \(error)")
                            }
                        }
                    }) {
                        Text(step == 1 ? "Continue" : "Get Started")
                            .font(.system(size: headerFontSize))
                            .bold()
                            .foregroundStyle(.white)
                            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                            .padding(.vertical, 16)
                    }
                    .background(Color("BGNavyBlue"))
                    .cornerRadius(cornerRadius)
                }
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity)
                .onTapGesture {
                    hideKeyboard()
                }
            }
            .padding(.horizontal, containerPadding)
            .background(Color("BGGray"))
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden()
        }
    }
}

#Preview {
    OnboardingView()
}
