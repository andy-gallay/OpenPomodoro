//
//  Timer.swift
//  OpenPomodoro
//
//  Created by Andy GALLAY on 2023-12-16.
//

import Foundation

@Observable
class PomodoroTimer {
    var id: Int
    var name: String
    var length: Int
    var remainingSeconds: Int {
        didSet {
            self.updateProgress()
        }
    }
    var progress: Double = 1.0
    var isRunning: Bool = false
    
    init(id: Int, name: String, length: Int) {
        self.id = id
        self.name = name
        self.length = length
        self.remainingSeconds = length
    }
    
    func reset() {
        self.isRunning = false
        self.remainingSeconds = self.length
    }
    
    func decrementSeconds() {
        if self.remainingSeconds > 0 {
            self.remainingSeconds -= 1
        }
    }
    
    private func updateProgress() {
        self.progress = Double(self.remainingSeconds) / Double(self.length)
    }
    
    func toggleTimer() {
        self.isRunning = !self.isRunning
    }
    
    func setLength(length: Int) {
        self.length = length
    }
}
