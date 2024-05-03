//
//  DataManager.swift
//  NutriSnap
//
//  Created by Michael Eko on 03/05/24.
//

import CoreData
import Foundation

class DataManager: NSObject, ObservableObject {
    @Published var meals: [Meal] = [Meal]()
    let container: NSPersistentContainer = NSPersistentContainer(name: "Nutrisnap")
    
    override init() {
        super.init()
        container.loadPersistentStores { _, _ in
        
        }
    }
}
