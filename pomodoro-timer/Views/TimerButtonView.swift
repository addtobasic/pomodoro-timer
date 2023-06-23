//
//  TimerButtonView.swift
//  pomodoro-timer
//
//  Created by genshi on 2023/06/23.
//

import SwiftUI

struct TimerButtonView: View {
    @EnvironmentObject var timerViewModel: TimerViewModel

    var body: some View {
        HStack {
            Button(action: {
                if timerViewModel.isTimerRunning {
                    timerViewModel.stopTimer()
                }
                else if timerViewModel.isRestart {
                    timerViewModel.restartTimer()
                }
                else {
                    timerViewModel.startTimer()
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

struct TimerButtonView_Previews: PreviewProvider {
    static var previews: some View {
        TimerButtonView()
            .environmentObject(TimerViewModel(duration: 500))
    }
}