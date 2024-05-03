//
//  MealCard.swift
//  NutriSnap
//
//  Created by Michael Eko on 29/04/24.
//

import SwiftUI

struct MealCard: View {
    let imageSize: CGFloat = 64
    let cardTitleSize: CGFloat = 16
    let cardBodySize: CGFloat = 12
    var mealName: String
    var image: Data
    var calorie: String
    
    var body: some View {
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 12)
                .fill(.white)
            HStack{
                Image(uiImage: UIImage(data: image)!)
                    .resizable()
                    .frame(width: imageSize, height: imageSize)
                    .cornerRadius(8)
                    .padding(.trailing, 8)
                VStack(alignment: .leading) {
                    Text(mealName)
                        .font(.system(size: cardTitleSize))
                        .bold()
                        .padding(.bottom, 2)
                    Text("\(calorie) calories")
                        .font(.system(size: cardBodySize))
                        .bold()
                        .foregroundStyle(Color("TextOrange"))
                }
            }
            .padding(16)
        }
        .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
    }
}

//#Preview {
//    MealCard()
//}
