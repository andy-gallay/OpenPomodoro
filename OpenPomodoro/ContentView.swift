//
//  ContentView.swift
//  OpenPomodoro
//
//  Created by Andy GALLAY on 2023-12-16.
//

import SwiftUI

struct ContentView: View {
    @Environment(ModelData.self) var modelData
    @State private var draftPreferences: Preferences = Preferences.default
    
    var body: some View {
        ZStack {
            VStack {
                PreferencesBar(draftPreferences: $draftPreferences)
                    .frame(maxHeight: 25)
                    .padding()
                Spacer()
                if !modelData.isEditingPreferences {
                    TimerView(pomodoroTimer: .constant(modelData.timers[0]))
                        .frame(maxHeight: 400)
                        .padding()
                    Spacer()
                    SessionStatsView()
                        .frame(minHeight: 200)
                } else {
                    PreferencesEditor(draftPreferences: $draftPreferences)
                }
            }.blur(radius: modelData.isEditingStats ? 10.0 : 0.0)
                .opacity(modelData.isEditingStats ? 0.3 : 1.0)
            if modelData.isEditingStats {
                ValueSliderView()
            }
        }
    }
}

#Preview {
    ContentView()
        .environment(ModelData())
}
