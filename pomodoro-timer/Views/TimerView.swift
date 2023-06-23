//
//  TimerView.swift
//  pomodoro-timer
//
//  Created by genshi on 2023/06/21.
//

import SwiftUI

struct TimerView: View {
    @StateObject var timerViewModel = TimerViewModel()

    var body: some View {
        VStack {
            Text(timerViewModel.timeString)
                .font(.largeTitle)
                .padding()
                .foregroundColor(Theme.mainColor)
                .background(Theme.backgroundColor)
            
            HStack {
                Button(action: {
                    if timerViewModel.isTimerRunning {
                        timerViewModel.stopTimer()
                    }
                    else if timerViewModel.isRestart {
                        timerViewModel.restartTimer()
                    }
                    else {
                        timerViewModel.startTimer(with: 25*60)
                    }
                }) {
                    Image(systemName: timerViewModel.isTimerRunning ? "stop.circle" : "play.circle")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .foregroundColor(Theme.mainColor)
                }
                
                Button(action: {
                    timerViewModel.resetTimer()
                }) {
                    Image(systemName: "arrow.counterclockwise.circle")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .foregroundColor(Theme.mainColor)
                }
            }
        }
    }
}
