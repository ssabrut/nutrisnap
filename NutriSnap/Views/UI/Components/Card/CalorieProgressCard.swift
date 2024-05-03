//
//  CalorieProgressCard.swift
//  NutriSnap
//
//  Created by Michael Eko on 29/04/24.
//

import SwiftUI

struct CalorieProgressCard: View {
    @Binding var user: User?
    var calorieLogged: Int
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 12)
                .fill(.white)
            VStack(alignment: .leading) {
                Text("Calorie Progress")
                    .font(.system(size: 18))
                    .bold()
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 8, trailing: 0))
                HStack(spacing: 24) {
                    VStack {
                        Text(String(user?.upperThresholdCalorie ?? 0))
                            .font(.system(size: 15))
                            .bold()
                            .padding(EdgeInsets(top: 0, leading: 0, bottom: 2, trailing: 0))
                        Text("Goal")
                            .font(.system(size: 12))
                            .fontWeight(.semibold)
                            .foregroundStyle(Color.gray)
                    }
                    VStack {
                        Text("-")
                            .font(.system(size: 18))
                            .bold()
                    }
                    VStack {
                        Text(String(calorieLogged))
                            .font(.system(size: 15))
                            .bold()
                            .padding(EdgeInsets(top: 0, leading: 0, bottom: 2, trailing: 0))
                        Text("Logged")
                            .font(.system(size: 12))
                            .fontWeight(.semibold)
                            .foregroundStyle(Color.gray)
                    }
                    VStack {
                        Text("=")
                            .font(.system(size: 18))
                            .bold()
                    }
                    VStack {
                        Text(String(Int(user?.upperThresholdCalorie ?? 0) - calorieLogged))
                            .font(.system(size: 15))
                            .bold()
                            .foregroundStyle(Color("TextOrange"))
                            .padding(EdgeInsets(top: 0, leading: 0, bottom: 2, trailing: 0))
                        Text("Remaining")
                            .font(.system(size: 12))
                            .fontWeight(.semibold)
                            .foregroundStyle(.gray)
                    }
                }
                .frame(maxWidth: .infinity)
            }
            .padding(16)
        }
        .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
        .padding(EdgeInsets(top: 0, leading: 0, bottom: 24, trailing: 0))
    }
}

//#Preview {
//    CalorieProgressCard()
//}
