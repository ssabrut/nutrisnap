//
//  User.swift
//  NutriSnap
//
//  Created by Michael Eko on 30/04/24.
//

import Foundation

struct User: Codable {
    var bodyHeight: String
    var bodyWeight: String
    var age: String
    var activity: Activity
    var goal: Goal
}
