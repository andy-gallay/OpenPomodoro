//
//  ModelData.swift
//  OpenPomodoro
//
//  Created by Andy GALLAY on 2023-12-16.
//

import Foundation

@Observable class ModelData {
    var isEditingPreferences: Bool = false
    var timers: [PomodoroTimer] = [
        PomodoroTimer(id: 1, name: "MainTimer", length: Preferences.default.timerDuration)
    ]
    var isEditingStats: Bool = false
    var preferences = Preferences.default
    
    var parameter: SessionParameter = SessionParameter(title: "title", description: "description", statValue: 0, sessionParameterEnum: SessionParameterEnum.none, sessionParameterMaxValue: 0)
}
