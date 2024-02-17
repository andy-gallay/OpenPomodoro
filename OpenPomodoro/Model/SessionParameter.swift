//
//  SessionStat.swift
//  OpenPomodoro
//
//  Created by Andy GALLAY on 2023-12-28.
//

import Foundation

enum SessionParameterEnum {
    case none
    case sessionLength
    case breakLength
    case recessLength
    case recessFrequency
}

@Observable
class SessionParameter {
    var title: String = "title"
    var description: String = "description"
    var statValue: Int = 0
    var sessionParameterEnum: SessionParameterEnum = SessionParameterEnum.none
    var sessionParameterMaxValue: Int = 0
    
    init(title: String, description: String, statValue: Int, sessionParameterEnum: SessionParameterEnum, sessionParameterMaxValue: Int) {
        self.title = title
        self.description = description
        self.statValue = statValue
        self.sessionParameterEnum = sessionParameterEnum
        self.sessionParameterMaxValue = sessionParameterMaxValue
    }
}
