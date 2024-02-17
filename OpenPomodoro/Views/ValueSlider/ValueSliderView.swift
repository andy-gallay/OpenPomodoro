//
//  ValueSliderView.swift
//  OpenPomodoro
//
//  Created by Andy GALLAY on 2023-12-29.
//

import SwiftUI

//

struct Config {
    let minimumValue: CGFloat
    let maximumValue: CGFloat
    let totalValue: CGFloat
    let knobRadius: CGFloat
    let radius: CGFloat
}

struct ValueSliderView: View {
    @Environment(ModelData.self) var modelData
    @State var sliderValue: CGFloat = 0.0
    @State var angleValue: CGFloat = 0.0
    var headtitle: String = "Session"
    var suffix: String = "min"
    var sessionParameterMaxValue: Int = 0
    
    let config = Config(minimumValue: 0.0,
                            maximumValue: 40.0,
                            totalValue: 40.0,
                            knobRadius: 13.0,
                            radius: 140.0)
    var body: some View {
        VStack {
            ZStack {
                VStack {
                    Text(modelData.parameter.title)
                        .font(.system(size: 35))
                    Text("\(String.init(format: "%.0f", sliderValue))" + " \(modelData.parameter.description)")
                    .font(.system(size: 50))
                    .foregroundColor(.blue)
                }
                
                Circle()
                    .stroke(Color.gray,
                    style: StrokeStyle(lineWidth: 3, lineCap: .butt, dash: []))
                                .frame(width: config.radius * 2, height: config.radius * 2)
                                .opacity(0.5)
                Circle()
                    .trim(from: 0.0, to: Double(sliderValue) / Double(modelData.parameter.sessionParameterMaxValue))
                    .stroke(Color.blue, lineWidth: 4)
                    .frame(width: config.radius * 2, height: config.radius * 2)
                    .rotationEffect(.degrees(-90))
                
                Circle()
                .fill(Color.blue)
                .frame(width: config.knobRadius * 2, height: config.knobRadius * 2)
                .padding(10)
                .offset(y: -config.radius)
                .rotationEffect(Angle.degrees(Double(angleValue)))
                .gesture(DragGesture(minimumDistance: 0.0)
                    .onChanged({ value in
                        change(location: value.location)
                    }))
            }
            Button(action: self.toggleEditingStat) {
                Text("Confirm")
            }
            .padding()
            .font(.system(size: 35))
        }
    }
    
    private func change(location: CGPoint) {
            // creating vector from location point
            let vector = CGVector(dx: location.x, dy: location.y)
            
            // geting angle in radian need to subtract the knob radius and padding
            let angle = atan2(vector.dy - (config.knobRadius + 10), vector.dx - (config.knobRadius + 10)) + .pi/2.0
            
            // convert angle range from (-pi to pi) to (0 to 2pi)
            let fixedAngle = angle < 0.0 ? angle + 2.0 * .pi : angle
            // convert angle value to temperature value
            let value = fixedAngle / (2.0 * .pi) * Double(modelData.parameter.sessionParameterMaxValue)
            
        if value >= 0.0 && value <= Double(modelData.parameter.sessionParameterMaxValue) {
                sliderValue = value
                angleValue = fixedAngle * 180 / .pi // converting to degree
            }
        }
    
    private func toggleEditingStat() {
        modelData.isEditingStats = false
    }
}

#Preview {
    ValueSliderView()
        .environment(ModelData())
}
