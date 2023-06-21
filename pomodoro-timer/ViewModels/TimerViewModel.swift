//
//  TimerViewModel.swift
//  pomodoro-timer
//
//  Created by genshi on 2023/06/21.
//

import SwiftUI

class TimerViewModel: ObservableObject {
    @Published var timeString: String = ""
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
    }

    func stopTimer() {
        timerModel.timer?.invalidate()
        timerModel.timer = nil
    }

    private func getTimeString(from seconds: Int) -> String {
        let minutes = seconds / 60
        let seconds = seconds % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
}
