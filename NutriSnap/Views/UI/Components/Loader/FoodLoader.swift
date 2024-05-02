//
//  FoodLoader.swift
//  NutriSnap
//
//  Created by Michael Eko on 02/05/24.
//

import SwiftUI

struct FoodLoader: View {
    @State private var isAnimating: Bool = false
    @State private var image: Int = 1
    
    private var foregroundColor: Color = .white
    private var backgroundColor: Color = .pink
    
    var body: some View {
        ZStack {
            VStack {
                Image("\(image)")
                    .renderingMode(.template)
                    .resizable()
                    .frame(width: 100, height: 100)
                    .rotationEffect(Angle(degrees: isAnimating ? 1080 : 0))
                    .animation(
                        Animation
                            .easeInOut(duration: 0.7)
                            .delay(isAnimating ? 0.5 : 0)
                            .repeatForever(autoreverses: false)
                    )
                    .scaleEffect(isAnimating ? 1 : 0)
                    .animation(
                        Animation
                            .easeInOut(duration: 0.7)
                            .delay(isAnimating ? 0.5 : 0)
                            .repeatForever(autoreverses: true)
                    )
            }
            .frame(width: 130, height: 130)
            .onAppear() {
                Timer.scheduledTimer(withTimeInterval: 2.4, repeats: true) { _ in
                    self.image = Int.random(in: 1...10)
                }
                self.isAnimating = true
            }
            .foregroundColor(.white)
        }
        .background(.red)
        .ignoresSafeArea()
    }
}

#Preview {
    FoodLoader()
}
