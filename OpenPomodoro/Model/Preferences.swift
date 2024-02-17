//
//  Preferences.swift
//  OpenPomodoro
//
//  Created by Andy GALLAY on 2023-12-24.
//

import Foundation

@Observable class Preferences {
    // 25 minutes = 1500 seconds
    // 5 minutes = 300 seconds
    var timerDuration: Int = 1500;
    var breakDuration: Int = 300;
    var recessInterval: Int = 4;
    var longBreakDuration: Int = 1200;
    var metronomeSound: Bool = false;
    var pauseBeforeBreak: Bool = false;
    var pauseBeforeRecess: Bool = false;
    var prefersNotifications: Bool = false;
    
    static let `default` = Preferences()
}
