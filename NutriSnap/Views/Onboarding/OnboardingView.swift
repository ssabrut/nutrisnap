//
//  OnboardingView.swift
//  NutriSnap
//
//  Created by Michael Eko on 29/04/24.
//

import SwiftUI

struct OnboardingView: View {
    @State private var step: Int = 1
    @State private var user: User = User(bodyHeight: 0, bodyWeight: 0, age: 0, gender: .male, activity: .minimal, goal: .loss)
    @State private var isCalculating: Bool = false
    @State private var isDisabled: Bool = false
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    if step == 1 {
                        IntroductionModifier()
                    } else if step == 2 {
                        InputUserDataModifier(user: $user, isDisabled: $isDisabled)
                    }
                    
                    Spacer()
                    
//                    NavigationLink(destination: CalculateView(
//                        bodyWeight: $bodyWeight,
//                        bodyHeight: $bodyHeight,
//                        age: $age,
//                        gender: $gender,
//                        selectedActivity: $selectedActivity,
//                        selectedGoal: $selectedGoal
//                    ), isActive: $isCalculating) {
//                        EmptyView()
//                    }
                    
                    Button(action: {
                        if step == 1 {
                            step = 2
                            isDisabled.toggle()
                        } else {
                            isCalculating.toggle()
                        }
                    }) {
                        Text(step == 1 ? "Continue" : "Get Started")
                            .font(.system(size: Shared.headerFontSize))
                            .bold()
                            .foregroundStyle(.white)
                            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                            .padding(.vertical, 16)
                    }
                    .background(isDisabled ? .gray : Color("BGNavyBlue"))
                    .cornerRadius(Shared.cornerRadius)
                    .disabled(isDisabled)
                }
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity)
            }
            .padding(.horizontal, Shared.containerPadding)
            .background(Color("BGGray"))
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden()
        }
        .onTapGesture {
            hideKeyboard()
        }
    }
}

#Preview {
    OnboardingView()
}
