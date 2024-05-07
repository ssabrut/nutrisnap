//
//  Header.swift
//  NutriSnap
//
//  Created by Michael Eko on 30/04/24.
//

import SwiftUI

struct Header: View {
    private let titleFontSize: CGFloat = 32
    private let headerFontSize: CGFloat = 18
    var firstParagraph: String
    var secondParagraph: String = ""
    
    var body: some View {
        HStack(spacing: 0) {
            Text("Nutri")
                .font(.system(size: titleFontSize))
                .fontWeight(.heavy)
                .foregroundStyle(Color("TextOrange"))
            Text("Snap")
                .font(.system(size: titleFontSize))
                .fontWeight(.heavy)
                .foregroundStyle(Color("TextNavyBlue"))
        }
        .padding(.bottom, 2)
        Text(firstParagraph)
            .font(.system(size: headerFontSize))
            .bold()
        Text(secondParagraph)
            .font(.system(size: headerFontSize))
            .bold()
    }
}

#Preview {
    Header(firstParagraph: "Track what you eat in", secondParagraph: "seconds with AI")
}
