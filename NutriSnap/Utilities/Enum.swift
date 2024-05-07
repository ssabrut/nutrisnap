//
//  Enum.swift
//  NutriSnap
//
//  Created by Michael Eko on 07/05/24.
//

import Foundation

enum Activity: String, CaseIterable, Identifiable, Codable {
    case minimal, moderate, active
    var id: Self { self }
}

enum Goal: String, CaseIterable, Identifiable, Codable {
    case loss, maintenance, gain
    var id: Self { self }
}

enum Gender: String, CaseIterable, Identifiable, Codable {
    case male, female
    var id: Self { self }
}
