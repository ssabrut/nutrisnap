//
//  UserDataForm.swift
//  NutriSnap
//
//  Created by Michael Eko on 02/05/24.
//

import SwiftUI

struct FormModifier: View {
    @Binding var user: User
    @Binding var isDisabled: Bool
    @State private var counter: Int = 0
    
    var body: some View {
        Form {
            HStack {
                Text("Body Weight")
                Spacer()
                TextField("kg", value: $user.bodyWeight, formatter: NumberFormatter(), onEditingChanged: { isFocused in
                    if !isFocused && user.bodyWeight > 0 {
                        counter += 1;
                        if counter == 3 {
                            isDisabled.toggle()
                        }
                    }
                })
                .keyboardType(.numberPad)
                .multilineTextAlignment(.trailing)
                .frame(maxWidth: .infinity)
            }
            HStack {
                Text("Body Height")
                Spacer()
                TextField("cm", value: $user.bodyHeight, formatter: NumberFormatter(), onEditingChanged: { isFocused in
                    if !isFocused && user.bodyHeight > 0 {
                        counter += 1;
                        if counter == 3 {
                            isDisabled.toggle()
                        }
                    }
                })
                .keyboardType(.numberPad)
                .multilineTextAlignment(.trailing)
                .frame(maxWidth: .infinity)
            }
            HStack {
                Text("Age")
                Spacer()
                TextField("Age", value: $user.age, formatter: NumberFormatter(), onEditingChanged: { isFocused in
                    if !isFocused && user.age > 0 {
                        counter += 1;
                        if counter == 3 {
                            isDisabled.toggle()
                        }
                    }
                })
                .keyboardType(.numberPad)
                .multilineTextAlignment(.trailing)
                .frame(maxWidth: .infinity)
            }
            List {
                HStack {
                    Picker("Gender", selection: $user.gender) {
                        Text("Male").tag(Gender.male)
                        Text("Female").tag(Gender.female)
                    }
                    .pickerStyle(.menu)
                }
            }
            List {
                HStack {
                    Picker("Activity", selection: $user.activity) {
                        Text("Minimal (1-2 times a week)").tag(Activity.minimal)
                        Text("Moderate (3-4 times a week)").tag(Activity.moderate)
                        Text("Active (5-7 times a week)").tag(Activity.active)
                    }
                    .pickerStyle(.menu)
                }
            }
            List {
                HStack {
                    Picker("Goal", selection: $user.goal) {
                        Text("Weight Loss").tag(Goal.loss)
                        Text("Maintenance").tag(Goal.maintenance)
                        Text("Weight Gain").tag(Goal.gain)
                    }
                    .pickerStyle(.menu)
                }
            }
        }
    }
}
