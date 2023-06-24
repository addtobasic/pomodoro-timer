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
        ZStack {
            Circle()
                .stroke(lineWidth: 12)
                .opacity(0.3)
                .foregroundColor(Color.gray)
            
            Circle()
                .trim(from: 0, to: CGFloat(reversedProgress))
                .stroke(style: StrokeStyle(lineWidth: 12, lineCap: .round))
                .foregroundColor(Theme.mainColor)
                .rotationEffect(.degrees(-90))
            
            Text(timerViewModel.timeString)
                .font(.system(size: 54))
                .padding()
                .foregroundColor(Theme.mainColor)
                .background(Theme.backgroundColor)
        }
        .frame(width: 300, height: 300)
    }
}

struct CircleProgressBarView_Previews: PreviewProvider {
    static var previews: some View {
        CircleProgressBarView()
            .environmentObject(TimerViewModel(duration: 300))
    }
}
