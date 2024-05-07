//
//  InputUserDataModifier.swift
//  NutriSnap
//
//  Created by Michael Eko on 07/05/24.
//

import SwiftUI

struct InputUserDataModifier: View {
    @Binding var user: User
    @Binding var isDisabled: Bool
    
    var body: some View {
        Header(firstParagraph: "To tailor our application perfectly", secondParagraph: "to your needs, we'd love to")
        Text("learn a bit more about you first...")
            .font(.system(size: Shared.headerFontSize))
            .bold()
        FormModifier(user: $user, isDisabled: $isDisabled)
    }
}

//#Preview {
//    InputUserDataModifier()
//}
