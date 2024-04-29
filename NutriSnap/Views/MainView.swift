//
//  MainView.swift
//  NutriSnap
//
//  Created by Michael Eko on 29/04/24.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        ZStack {
            VStack(alignment: .leading) {
                HStack {
                    Text("Today")
                        .font(.system(size: 18))
                        .fontWeight(.bold)
                    Spacer()
                    Button(action: {
                        print("a")
                    }) {
                        Text("Edit Goals")
                            .font(.system(size: 12))
                            .fontWeight(.semibold)
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
                                Text("2500")
                                    .font(.system(size: 18))
                                    .bold()
                                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 4, trailing: 0))
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
                                Text("1600")
                                    .font(.system(size: 18))
                                    .bold()
                                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 4, trailing: 0))
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
                                Text("700")
                                    .font(.system(size: 18))
                                    .bold()
                                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 4, trailing: 0))
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
                ZStack(alignment: .leading) {
                    RoundedRectangle(cornerRadius: 12)
                        .fill(.white)
                    HStack{
                        Image("Nasi")
                            .resizable()
                            .frame(width: 64, height: 64)
                            .cornerRadius(8)
                            .padding(.trailing, 8)
                        VStack(alignment: .leading) {
                            Text("Nasi Ayam")
                                .font(.system(size: 16))
                                .bold()
                                .padding(.bottom, 2)
                            Text("1.250 calories")
                                .font(.system(size: 12))
                                .bold()
                                .foregroundStyle(Color("TextOrange"))
                        }
                    }
                    .padding(16)
                }
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: 100)
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
