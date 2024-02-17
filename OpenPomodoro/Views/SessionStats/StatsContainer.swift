//
//  StatsContainer.swift
//  OpenPomodoro
//
//  Created by Andy GALLAY on 2023-12-26.
//

import SwiftUI

struct StatsContainer: View {
    @Environment(ModelData.self) var modelData
    var statTitle: String = "Headtitle"
    var suffix: String  = "Description"
    var statValue: Int = 0
    var parameterEnum: SessionParameterEnum = SessionParameterEnum.none
    var sessionParameterMaxValue: Int = 0
    let lightGray = Color(red: 0.95, green: 0.95, blue: 0.92, opacity: 0.6)
    var body: some View {
        VStack(alignment: .center) {
            VStack {
                Text(statTitle)
                    .font(.system(size: 20, weight: .bold))
            }.frame(width: 150, alignment: .leading)
            VStack {
                Text("\(statValue) " + suffix)
                    .font(.system(size: 20))
            }.frame(width: 150, alignment: .trailing)
        }
        .frame(width: 170, height: 70)
        .background(lightGray)
        .cornerRadius(15)
        .onTapGesture {
            self.onTap()
        }
    }
    
    private func onTap() {
        modelData.isEditingStats = true
        modelData.parameter = SessionParameter(title: statTitle, description: suffix, statValue: statValue, sessionParameterEnum: parameterEnum, sessionParameterMaxValue: sessionParameterMaxValue)
    }
}

#Preview {
    StatsContainer(statTitle: "Pause", suffix: "min").environment(ModelData())
}
    
