//
//  PreferencesEditor.swift
//  OpenPomodoro
//
//  Created by Andy GALLAY on 2023-12-24.
//

import SwiftUI

struct PreferencesEditor: View {
    @Environment(ModelData.self) var modelData
    @Binding var draftPreferences: Preferences
    
    var body: some View {
        List {
            Toggle(isOn: $draftPreferences.prefersNotifications) {
                Text("Enable Notifications")
            }
            Toggle(isOn: $draftPreferences.pauseBeforeBreak) {
                Text("Start break automatically")
            }
            Toggle(isOn: $draftPreferences.pauseBeforeRecess) {
                Text("Start recess automatically")
            }
            Toggle(isOn: $draftPreferences.metronomeSound) {
                Text("Metronome")
            }
        }
    }
}

#Preview {
    PreferencesEditor(draftPreferences: .constant(Preferences.default))
        .environment(ModelData())
}
