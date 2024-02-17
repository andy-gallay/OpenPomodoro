//
//  OpenPomodoroApp.swift
//  OpenPomodoro
//
//  Created by Andy GALLAY on 2023-12-16.
//

import SwiftUI

@main
struct OpenPomodoroApp: App {
    @State private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(modelData)
        }
    }
}
