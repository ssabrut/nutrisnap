//
//  Meal+CoreDataProperties.swift
//  NutriSnap
//
//  Created by Michael Eko on 03/05/24.
//
//

import Foundation
import CoreData


extension Meal {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Meal> {
        return NSFetchRequest<Meal>(entityName: "Meal")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var image: Data?
    @NSManaged public var name: String?
    @NSManaged public var created_at: Date?
    @NSManaged public var classes: String?

}

extension Meal : Identifiable {

}
