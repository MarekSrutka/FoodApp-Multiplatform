//
//  SettingsView.swift
//  FoodApp
//
//  Created by Marek Srutka on 30.03.2024.
//

import SwiftUI

struct SettingsView: View {
    
    @Binding var layoutExperience: LayoutExperienceSettings?
    
    var body: some View {
        ScrollView {
            VStack {
                if UIDevice.current.userInterfaceIdiom != .phone {
                    LayoutExperienceView(selectedLayoutExperience: $layoutExperience)
                }
                
                Text ("This view is Settings for iPad and Mac 😀")
            }
        }
        .navigationTitle("Settings")
    }
}

#Preview {
    NavigationStack {
        SettingsView(layoutExperience: .constant(.twoColumn))
    }
    
}
