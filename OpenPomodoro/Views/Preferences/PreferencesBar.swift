//
//  PreferencesBar.swift
//  OpenPomodoro
//
//  Created by Andy GALLAY on 2023-12-27.
//

import SwiftUI

struct PreferencesBar: View {
    @Environment(ModelData.self) var modelData
    @Binding var draftPreferences: Preferences
    
    private func toggleIsEditingPreferences() {
        draftPreferences = modelData.preferences
        modelData.isEditingPreferences = true
    }
    
    private func cancelPreferencesEdit() {
        modelData.preferences = draftPreferences
        modelData.isEditingPreferences = false
    }
    
    var body: some View {
        HStack {
            if (modelData.isEditingPreferences) {
                Button(action: cancelPreferencesEdit) {
                    Label("", systemImage: "arrow.backward")
                        .font(.system(size: 30))
                        .tint(Color.cyan)
                }
                Spacer()
            } else {
                Spacer()
                Button(action: toggleIsEditingPreferences) {
                    Label("", systemImage: "gear")
                        .font(.system(size: 30))
                        .tint(Color.cyan)
                }
            }
        }
    }
}

#Preview {
    PreferencesBar(draftPreferences: .constant(Preferences.default))
        .environment(ModelData())
}
