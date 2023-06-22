//
//  TimerViewModel.swift
//  pomodoro-timer
//
//  Created by genshi on 2023/06/21.
//

import SwiftUI

class TimerViewModel: ObservableObject {
    @Published var timeString: String = ""
    @Published var isTimerRunning: Bool = false
    @Published var isRestart: Bool = false
    private var timerModel = TimerModel(timeRemaining: 0, timer: nil)

    func startTimer(with duration: Int) {
        timerModel.timeRemaining = duration
        timerModel.timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
            if self.timerModel.timeRemaining > 0 {
                self.timerModel.timeRemaining -= 1
                self.timeString = self.getTimeString(from: self.timerModel.timeRemaining)
            } else {
                self.stopTimer()
            }
        }
        
        isTimerRunning = true
    }

    func stopTimer() {
        timerModel.timer?.invalidate()
        timerModel.timer = nil
        
        isTimerRunning = false
        isRestart = true
    }
    
    func restartTimer() {
        startTimer(with: timerModel.timeRemaining)
    }
    
    func resetTimer() {
        stopTimer()
        timeString = ""
        isRestart = false
    }

    private func getTimeString(from seconds: Int) -> String {
        let minutes = seconds / 60
        let seconds = seconds % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
}
