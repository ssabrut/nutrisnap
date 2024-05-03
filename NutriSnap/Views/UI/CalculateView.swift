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
    private var bodyWeight: String = "47"
    private var bodyHeight: String = "165"
    private var age: String = "21"
    private var selectedActivity: Activity = .minimal
    private var selectedGoal: Goal = .loss
    
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
            
            VStack(alignment: .center) {
                if self.isActive {
                    MainView()
                } else {
                    FoodLoader()
                    Text("Calculating" + String(repeating: ".", count: numberOfDots))
                        .font(.system(size: 14))
                        .bold()
                }
            }
            .onAppear {
                Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
                    numberOfDots = (numberOfDots + 1) % 4
                }
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                    withAnimation {
                        self.isActive = true
                    }
                }
            }
            .navigationBarBackButtonHidden()
        }
    }
}

#Preview {
    CalculateView()
}
