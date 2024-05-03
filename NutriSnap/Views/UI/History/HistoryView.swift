//
//  HistoryView.swift
//  NutriSnap
//
//  Created by Michael Eko on 02/05/24.
//

import SwiftUI

struct HistoryView: View {
    var body: some View {
        NavigationView {
            ZStack {
                VStack(alignment: .leading) {
//                    CalorieProgressCard()
                    HStack {
                        Text("Meals")
                            .font(.system(size: 18))
                            .bold()
                        Spacer()
                    }
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 8, trailing: 0))
//                    MealCard()
                    Spacer()
                }
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity)
            }
            .padding(.horizontal, 24)
            .background(Color("BGGray"))
            .navigationTitle("Meal History")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden()
        }
    }
}

#Preview {
    HistoryView()
}
