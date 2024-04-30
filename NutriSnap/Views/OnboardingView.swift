//
//  OnboardingView.swift
//  NutriSnap
//
//  Created by Michael Eko on 29/04/24.
//

import SwiftUI

struct OnboardingView: View {
    let onboardingImageSize: CGFloat = 256
    let cornerRadius: CGFloat = 12
    let containerPadding: CGFloat = 24
    let headerFontSize: CGFloat = 18
    let titleFontSize: CGFloat = 32
    
    var body: some View {
        ZStack {
            VStack {
                HStack(spacing: 0) {
                    Text("Nutri")
                        .font(.system(size: titleFontSize))
                        .fontWeight(.heavy)
                        .foregroundStyle(Color("TextOrange"))
                    Text("Snap")
                        .font(.system(size: titleFontSize))
                        .fontWeight(.heavy)
                        .foregroundStyle(Color("TextNavyBlue"))
                }
                .padding(.bottom, 2)
                Text("Track what you eat in")
                    .font(.system(size: headerFontSize))
                    .bold()
                Text("seconds with AI")
                    .font(.system(size: headerFontSize))
                    .bold()
                Spacer()
                Image("OnboardingImage")
                    .resizable()
                    .frame(width: onboardingImageSize, height: onboardingImageSize)
                    .cornerRadius(cornerRadius)
                    .shadow(radius: 8, x: 8, y: 6)
                Spacer()
                Button(action: {
                    print("a")
                }) {
                    Text("Continue")
                        .font(.system(size: headerFontSize))
                        .bold()
                        .foregroundStyle(.white)
                }
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                .padding(.vertical, 16)
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
