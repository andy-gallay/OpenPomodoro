//
//  TimerView.swift
//  OpenPomodoro
//
//  Created by Andy GALLAY on 2023-12-17.
//

import SwiftUI

struct TimerView: View {
    @Environment(ModelData.self) var modelData
    @Binding var pomodoroTimer: PomodoroTimer
    @State private var timerObject = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    private func togglePomodoroTimer() {
        self.pomodoroTimer.toggleTimer()
        if (self.pomodoroTimer.isRunning) {
            self.timerObject = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
        } else {
            self.timerObject.upstream.connect().cancel()
        }
    }

    var body: some View {
        VStack(spacing: 20) {
            ZStack {
                CircularProgressView(progress: $pomodoroTimer.progress, isRunning: $pomodoroTimer.isRunning)
                        .frame(width: 330)
                RemainingTimeView(remainingSeconds: $pomodoroTimer.remainingSeconds)
                    .onReceive(timerObject) { input in
                        if (self.pomodoroTimer.isRunning) {
                            self.pomodoroTimer.decrementSeconds()
                        }else {
                            // Cancel the timer to avoid useless events waiting for user input
                            self.timerObject.upstream.connect().cancel()
                        }
                    }.opacity(self.pomodoroTimer.isRunning ? 1.0 : 0.5)
            }
                Button(action: self.togglePomodoroTimer) {
                    if (self.pomodoroTimer.isRunning) {
                        Label("", systemImage: "pause.fill")
                    } else {
                        Label("", systemImage: "play.fill")
                    }
                }
                .font(.system(size: 35))
                .tint(self.pomodoroTimer.isRunning ? Color.blue : Color.cyan)
        }.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
    }
}

#Preview {
    TimerView(pomodoroTimer: .constant(ModelData().timers[0]))
        .environment(ModelData())
}
