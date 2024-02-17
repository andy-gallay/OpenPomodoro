//
//  SessionStatsView.swift
//  OpenPomodoro
//
//  Created by Andy GALLAY on 2023-12-26.
//

import SwiftUI

struct SessionStatsView: View {
    @Environment(ModelData.self) var modelData
    var body: some View {
        VStack {
            HStack {
                StatsContainer(statTitle: "Session",
                               suffix: "min",
                               statValue: modelData.preferences.timerDuration / 60, parameterEnum: SessionParameterEnum.sessionLength, sessionParameterMaxValue: Constants.sessionLengthMaximumSec / 60)
                StatsContainer(statTitle: "Recess", suffix: "min", statValue: modelData.preferences.longBreakDuration / 60, parameterEnum: SessionParameterEnum.recessLength, sessionParameterMaxValue: Constants.recessDurationMaximumSec / 60)
            }
            HStack {
                StatsContainer(statTitle: "Break", suffix: "min", statValue: modelData.preferences.breakDuration / 60, parameterEnum: SessionParameterEnum.breakLength, sessionParameterMaxValue: Constants.breakDurationMaximumSec / 60)
                StatsContainer(statTitle: "Recess every", suffix: "sessions", statValue: modelData.preferences.recessInterval, parameterEnum: SessionParameterEnum.recessFrequency, sessionParameterMaxValue: Constants.recessPeriodMaximum)
            }
        }
    }
}

#Preview {
    SessionStatsView()
        .environment(ModelData())
}
