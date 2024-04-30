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
    
    var body: some View {
        ZStack {
            VStack {
                if step == 1 {
                    IntroductionOnboarding()
                } else {
                    UserDataOnboarding()
                }
                
                Spacer()
                Button(action: {
                    step = step == 1 ? 2 : 0 // change 0 to navigation
                }) {
                    if step == 1 {
                        Text("Continue")
                            .font(.system(size: headerFontSize))
                            .bold()
                            .foregroundStyle(.white)
                            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                            .padding(.vertical, 16)
                    } else {
                        Text("Get Started")
                            .font(.system(size: headerFontSize))
                            .bold()
                            .foregroundStyle(.white)
                            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                            .padding(.vertical, 16)
                    }
                }
                .background(Color("BGNavyBlue"))
                .cornerRadius(cornerRadius)
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
