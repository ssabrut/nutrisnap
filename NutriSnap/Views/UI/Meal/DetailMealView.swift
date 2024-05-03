//
//  DetailMealView.swift
//  NutriSnap
//
//  Created by Michael Eko on 03/05/24.
//

import SwiftUI

struct DetailMealView: View {
    @State var meal: Meal
    
    var body: some View {
        ScrollView {
            ZStack {
                VStack {
                    Image(uiImage: UIImage(data: meal.image!)!)
                        .resizable()
                        .scaledToFill()
                        .frame(width: .infinity, height: 256)
                        .cornerRadius(12)
                        .padding(.bottom, 8)
                    Group {
                        if let imageClass = meal.classes {
                            HStack{
                                Text("Food Detected:")
                                Text(imageClass)
                                    .bold()
                            }
                        } else {
                            HStack{
                                Text("Food Detected: NA")
                            }
                        }
                    }
                    .font(.subheadline)
                    .padding()
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding(EdgeInsets(top: 24, leading: 24, bottom: 0, trailing: 24))
        }
        .background(Color("BGGray"))
        .navigationTitle(meal.name!)
    }
}

//#Preview {
//    DetailMealView()
//}
