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
            if DeviceSize.isPhone {
                Button(action: {
                    if timerViewModel.isReset {
                        timerViewModel.resetTimer()
                    }
                    else if timerViewModel.isTimerRunning {
                        timerViewModel.stopTimer()
                    }
                    else if timerViewModel.isRestart {
                        timerViewModel.restartTimer()
                    }
                    else {
                        timerViewModel.startTimer()
                    }
                }) {
                    Image(systemName: timerViewModel.isTimerRunning ? "pause.circle" : "play.circle")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .foregroundColor(Theme.mainColor)
                        .padding(.trailing, 5)
                }
                
                Button(action: {
                    timerViewModel.resetTimer()
                }) {
                    Image(systemName: "arrow.counterclockwise.circle")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .foregroundColor(Theme.mainColor)
                        .padding(.leading, 5)
                }
            }
            else {
                Button(action: {
                    if timerViewModel.isReset {
                        timerViewModel.resetTimer()
                    }
                    else if timerViewModel.isTimerRunning {
                        timerViewModel.stopTimer()
                    }
                    else if timerViewModel.isRestart {
                        timerViewModel.restartTimer()
                    }
                    else {
                        timerViewModel.startTimer()
                    }
                }) {
                    Image(systemName: timerViewModel.isTimerRunning ? "pause.circle" : "play.circle")
                        .resizable()
                        .frame(width: 75, height: 75)
                        .foregroundColor(Theme.mainColor)
                        .padding(.trailing, 7.5)
                }
                
                Button(action: {
                    timerViewModel.resetTimer()
                }) {
                    Image(systemName: "arrow.counterclockwise.circle")
                        .resizable()
                        .frame(width: 75, height: 75)
                        .foregroundColor(Theme.mainColor)
                        .padding(.leading, 7.5)
                }
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
