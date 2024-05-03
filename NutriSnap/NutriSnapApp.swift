//
//  NutriSnapApp.swift
//  NutriSnap
//
//  Created by Michael Eko on 26/04/24.
//

import SwiftUI

@main
struct NutriSnapApp: App {
    @StateObject private var manager: DataManager = DataManager()
    
    var body: some Scene {
        WindowGroup {
            SplashView()
                .environmentObject(manager)
                .environment(\.managedObjectContext, manager.container.viewContext)
        }
    }
}
