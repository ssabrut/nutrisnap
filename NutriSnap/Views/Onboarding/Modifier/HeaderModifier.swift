//
//  Header.swift
//  NutriSnap
//
//  Created by Michael Eko on 30/04/24.
//

import SwiftUI

struct Header: View {
    var firstParagraph: String
    var secondParagraph: String = ""
    
    var body: some View {
        HStack(spacing: 0) {
            Text("Nutri")
                .font(.system(size: Shared.titleFontSize))
                .fontWeight(.heavy)
                .foregroundStyle(Color("TextOrange"))
            Text("Snap")
                .font(.system(size: Shared.titleFontSize))
                .fontWeight(.heavy)
                .foregroundStyle(Color("TextNavyBlue"))
        }
        .padding(.bottom, 2)
        Text(firstParagraph)
            .font(.system(size: Shared.headerFontSize))
            .bold()
        Text(secondParagraph)
            .font(.system(size: Shared.headerFontSize))
            .bold()
    }
}

#Preview {
    Header(firstParagraph: "Track what you eat in", secondParagraph: "seconds with AI")
}
