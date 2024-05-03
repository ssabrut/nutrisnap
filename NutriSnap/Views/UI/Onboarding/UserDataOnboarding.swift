//
//  UserDataOnboarding.swift
//  NutriSnap
//
//  Created by Michael Eko on 30/04/24.
//

import SwiftUI

struct UserDataOnboarding: View {
    private let headerFontSize: CGFloat = 18
    @Binding var bodyWeight: String
    @Binding var bodyHeight: String
    @Binding var age: String
    @Binding var gender: Gender
    @Binding var selectedActivity: Activity
    @Binding var selectedGoal: Goal
    
    var body: some View {
        Header(firstParagraph: "To tailor our application perfectly", secondParagraph: "to your needs, we'd love to")
        Text("learn a bit more about you first...")
            .font(.system(size: headerFontSize))
            .bold()
        UserDataForm(
            bodyWeight: $bodyWeight,
            bodyHeight: $bodyHeight,
            age: $age,
            gender: $gender,
            selectedActivity: $selectedActivity,
            selectedGoal: $selectedGoal
        )
    }
}

//#Preview {
//    UserDataOnboarding()
//}
