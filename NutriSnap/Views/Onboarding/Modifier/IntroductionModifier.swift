//
//  IntroductionOnboarding.swift
//  NutriSnap
//
//  Created by Michael Eko on 30/04/24.
//

import SwiftUI

struct IntroductionModifier: View {
    private let onboardingImageSize: CGFloat = 256
    private let cornerRadius: CGFloat = 12
    
    var body: some View {
        Header(firstParagraph: "Track what you eat in", secondParagraph: "seconds with AI")
        Image("OnboardingImage")
            .resizable()
            .frame(width: onboardingImageSize, height: onboardingImageSize)
            .cornerRadius(cornerRadius)
            .shadow(radius: 8, x: 8, y: 6)
            .padding(.top, 48)
    }
}

#Preview {
    IntroductionModifier()
}
