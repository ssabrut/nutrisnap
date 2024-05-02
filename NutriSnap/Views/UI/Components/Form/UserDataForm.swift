//
//  UserDataForm.swift
//  NutriSnap
//
//  Created by Michael Eko on 02/05/24.
//

import SwiftUI

enum Activity: String, CaseIterable, Identifiable, Codable {
    case minimal, moderate, active
    var id: Self { self }
}

enum Goal: String, CaseIterable, Identifiable, Codable {
    case loss, maintenance, gain
    var id: Self { self }
}

struct UserDataForm: View {
    @Binding var bodyWeight: String
    @Binding var bodyHeight: String
    @Binding var age: String
    @Binding var selectedActivity: Activity
    @Binding var selectedGoal: Goal
    
    var body: some View {
        Form {
            TextField("Body Weight (kg)", text: $bodyWeight)
                .keyboardType(.numberPad)
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                .padding(.vertical, 6)
            TextField("Body Height (cm)", text: $bodyHeight)
                .keyboardType(.numberPad)
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                .padding(.vertical, 6)
            TextField("Age", text: $age)
                .keyboardType(.numberPad)
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                .padding(.vertical, 6)
            List {
                HStack {
                    Text("Activity")
                    Spacer()
                    Picker("Activity", selection: $selectedActivity) {
                        Text("Minimal (1-2 times a week)").tag(Activity.minimal)
                        Text("Moderate (3-4 times a week)").tag(Activity.moderate)
                        Text("Active (5-7 times a week)").tag(Activity.active)
                    }
                    .pickerStyle(.menu)
                }
            }
            List {
                HStack {
                    Text("Goal")
                    Spacer()
                    Picker("Goal", selection: $selectedGoal) {
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