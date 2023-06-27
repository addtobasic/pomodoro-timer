//
//  CircleProgressBarView.swift
//  pomodoro-timer
//
//  Created by genshi on 2023/06/23.
//

import SwiftUI

struct CircleProgressBarView: View {
    @EnvironmentObject var timerViewModel: TimerViewModel
    
    private var progress: Double {
        let totalTime = Double(timerViewModel.initialDuration)
        let remainingTime = Double(timerViewModel.timerModel.timeRemaining)
        
        return (totalTime - remainingTime) / totalTime
    }
    
    private var reversedProgress: Double {
        return 1 - progress
    }
    
    var body: some View {
        @Environment(\.horizontalSizeClass) var horizontalSizeClass
        @Environment(\.verticalSizeClass) var verticalSizeClass
        
        if horizontalSizeClass == .compact && verticalSizeClass == .regular {
            ZStack {
                Circle()
                    .stroke(lineWidth: 16)
                    .opacity(0.3)
                    .foregroundColor(Color.gray)
                
                Circle()
                    .trim(from: 0, to: CGFloat(reversedProgress))
                    .stroke(style: StrokeStyle(lineWidth: 16, lineCap: .round))
                    .foregroundColor(Theme.mainColor)
                    .rotationEffect(.degrees(-90))
                
                Text(timerViewModel.timeString)
                    .font(.system(size: 54, design: .monospaced))
                    .fontWeight(.medium)
                    .padding()
                    .foregroundColor(Theme.textColor)
            }
            .frame(width: 300, height: 300)
        }
        else {
            ZStack {
                Circle()
                    .stroke(lineWidth: 24)
                    .opacity(0.3)
                    .foregroundColor(Color.gray)
                
                Circle()
                    .trim(from: 0, to: CGFloat(reversedProgress))
                    .stroke(style: StrokeStyle(lineWidth: 24, lineCap: .round))
                    .foregroundColor(Theme.mainColor)
                    .rotationEffect(.degrees(-90))
                
                Text(timerViewModel.timeString)
                    .font(.system(size: 81, design: .monospaced))
                    .fontWeight(.medium)
                    .padding()
                    .foregroundColor(Theme.textColor)
            }
            .frame(width: 450, height: 450)
        }
    }
}

struct CircleProgressBarView_Previews: PreviewProvider {
    static var previews: some View {
        CircleProgressBarView()
            .environmentObject(TimerViewModel(duration: 300))
    }
}
