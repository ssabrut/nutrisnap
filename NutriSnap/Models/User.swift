//
//  User.swift
//  NutriSnap
//
//  Created by Michael Eko on 07/05/24.
//

import Foundation

struct User: Codable {
    var bodyHeight: Int
    var bodyWeight: Int
    var age: Int
    var gender: Gender
    var activity: Activity
    var goal: Goal
    var bmi: Float
    var bottomThresholdCalorie: Int
    var upperThresholdCalorie: Int
}
