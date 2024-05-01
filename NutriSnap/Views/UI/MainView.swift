//
//  MainView.swift
//  NutriSnap
//
//  Created by Michael Eko on 29/04/24.
//

import SwiftUI
import AVFoundation

struct SheetView: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        Button(action: {
            print("a")
        }) {
            Text("Dismiss")
        }
    }
}

struct MainView: View {    
    @State private var isGoalSheetShow: Bool = false
    
    var body: some View {
        ZStack {
            VStack(alignment: .leading) {
                HStack {
                    Text("Today")
                        .font(.system(size: 18))
                        .fontWeight(.bold)
                    Spacer()
                    Button(action: {
                        isGoalSheetShow = true
                    }) {
                        Text("Edit Goals")
                            .font(.system(size: 12))
                            .fontWeight(.semibold)
                    }
                    .sheet(isPresented: $isGoalSheetShow) {
                        SheetView()
                    }
                }
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 8, trailing: 0))
                ZStack(alignment: .leading) {
                    RoundedRectangle(cornerRadius: 12)
                        .fill(.white)
                    VStack(alignment: .leading) {
                        Text("Calories Intake")
                            .font(.system(size: 18))
                            .bold()
                            .padding(EdgeInsets(top: 0, leading: 0, bottom: 2, trailing: 0))
                        Text("Remaining = Goal - Food")
                            .font(.system(size: 12))
                            .fontWeight(.semibold)
                            .foregroundStyle(.gray)
                    }
                    .padding(16)
                }
                .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 8, trailing: 0))
                CalorieProgressCard()
                HStack {
                    Text("Recent Meals")
                        .font(.system(size: 18))
                        .bold()
                    Spacer()
                    Button(action: {
                        print("a")
                    }) {
                        Text("+ Add Meal")
                            .font(.system(size: 12))
                            .bold()
                    }
                }
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 8, trailing: 0))
                MealCard()
                Spacer()
            }
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity)
        }
        .padding(EdgeInsets(top: 0, leading: 24, bottom: 0, trailing: 24))
        .background(Color("BGGray"))
    }
}

#Preview {
    MainView()
}
