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
                    Label("Dashboard", systemImage: "square.grid.3x3")
                }
                .navigationBarBackButtonHidden()
            HistoryView()
                .tabItem {
                    Label("History", systemImage: "clock")
                }
                .navigationBarBackButtonHidden()
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person")
                }
                .navigationBarBackButtonHidden()
        }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    MainView()
}
