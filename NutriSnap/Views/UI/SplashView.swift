//
//  SplashView.swift
//  NutriSnap
//
//  Created by Michael Eko on 26/04/24.
//

import SwiftUI

struct SplashView: View {
    @State var isActive: Bool = false
    @State var isDataAvailable: Bool = false
    
    var body: some View {
        ZStack {
            if self.isActive {
                if self.isDataAvailable {
                    MainView()
                } else {
                    OnboardingView()
                }
            } else {
                Image("Logo")
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                withAnimation {
                    if ((UserDefaults.standard.string(forKey: "user")?.isEmpty) == false) {
                        self.isDataAvailable = true
                    }
                    self.isActive = true
                }
            }
        }
    }
}

#Preview {
    SplashView()
}
