//
//  SplashView.swift
//  NutriSnap
//
//  Created by Michael Eko on 26/04/24.
//

import SwiftUI

struct SplashView: View {
    @State private var isActive = false
    @State private var isDataAvailable = false

    var body: some View {
        ZStack {
            RadialGradient(
                gradient: Gradient(colors: [.white, Color("BGCyan")]),
                center: .center,
                startRadius: 0,
                endRadius: 256
            )
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .ignoresSafeArea()

            if isActive {
                if isDataAvailable {
                    MainView()
                } else {
                    OnboardingView()
                }
            } else {
                Image("Logo")
                    .resizable()
                    .frame(width: 256, height: 256)
            }
        }
        .onAppear {
            DispatchQueue.main.async {
                if let user = UserDefaults.standard.string(forKey: "user"), !user.isEmpty {
                    self.isDataAvailable = true
                }
                withAnimation {
                    self.isActive = true
                }
            }
        }
    }

}

#Preview {
    SplashView()
}
