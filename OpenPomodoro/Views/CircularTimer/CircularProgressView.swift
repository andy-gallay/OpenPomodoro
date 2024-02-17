//
//  CircularShape.swift
//  OpenPomodoro
//
//  Created by Andy GALLAY on 2023-12-16.
//

import SwiftUI

struct CircularProgressView: View {
    
    @Binding var progress: Double
    @Binding var isRunning: Bool
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(
                    isRunning ? Color.blue.opacity(0.5) : Color.cyan.opacity(0.5),
                    lineWidth: 30
            )
            Circle()
                .trim(from: 0.0, to: progress)
                .stroke(
                    isRunning ? Color.blue : Color.cyan,
                    style: StrokeStyle(
                        lineWidth: 30,
                        lineCap: .round
                    )
                )
                .rotationEffect(.degrees(-90))
                .animation(.easeOut, value: progress)
        }
        .padding([.bottom, .top])
    }
}

#Preview {
    return CircularProgressView(progress: .constant(0.3), isRunning: .constant(false))
}
