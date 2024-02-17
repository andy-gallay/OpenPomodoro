//
//  RemainingTimeView.swift
//  OpenPomodoro
//
//  Created by Andy GALLAY on 2023-12-17.
//

import SwiftUI

struct RemainingTimeView: View {
    
    @Binding var remainingSeconds: Int
    
    func formatRemainingTime() -> String {
        if remainingSeconds > 59 {
            let minutes = remainingSeconds / 60
            let seconds = remainingSeconds % 60
            let minutesPadding = minutes > 9 ? "" : "0"
            let secondsPadding = seconds > 9 ? "" : "0"
            return(minutesPadding + "\(minutes):" + secondsPadding + "\(seconds)")
        } else {
            let secondsPadding = remainingSeconds > 9 ? "" : "0"
            return("00:" + secondsPadding + "\(remainingSeconds)")
        }
    }
    
    var body: some View {
        Text(formatRemainingTime())
            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            .font(.system(size: 45))
    }
}

#Preview {
    RemainingTimeView(remainingSeconds: .constant(23))
}
