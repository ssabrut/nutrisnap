//
//  MainView.swift
//  NutriSnap
//
//  Created by Michael Eko on 29/04/24.
//

import SwiftUI
import AVFoundation

struct MainView: View {    
    var body: some View {
        TabView {
            DashboardView()
                .tabItem {
                    Text("Dashboard")
                }
        }
    }
}

#Preview {
    MainView()
}
