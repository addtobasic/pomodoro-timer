//
//  TimerViewModel.swift
//  pomodoro-timer
//
//  Created by genshi on 2023/06/21.
//

import SwiftUI
import AVFoundation

class TimerViewModel: ObservableObject {
    @Published var timeString: String = ""
    @Published var isTimerRunning: Bool = false
    @Published var isRestart: Bool = false
    @Published var isReset: Bool = false
    var timerModel: TimerModel
    var initialDuration: Int
    private var bellPlayer: AVPlayer
    
    init(duration: Int) {
        initialDuration = duration
        timerModel = TimerModel(timeRemaining: duration, timer: nil)
        bellPlayer = AVPlayer.sharedBellPlayer
        timeString = getTimeString(from: duration)
    }

    func startTimer() {
        timerModel.timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
            if self.timerModel.timeRemaining > 0 {
                self.timerModel.timeRemaining -= 1
                self.timeString = self.getTimeString(from: self.timerModel.timeRemaining)
            } else {
                self.isReset = true
                self.timerModel.timer?.invalidate()
                self.timerModel.timer = nil
                self.isTimerRunning = false
                self.bellPlayer.playBellSound()
            }
        }
        
        isTimerRunning = true
    }

    func stopTimer() {
        timerModel.timer?.invalidate()
        timerModel.timer = nil
        
        isTimerRunning = false
        isRestart = true
        
        bellPlayer.stopBellSound()
    }
    
    func restartTimer() {
        startTimer()
    }
    
    func resetTimer() {
        stopTimer()
        timerModel.timeRemaining = initialDuration
        timeString = getTimeString(from: initialDuration)
        isRestart = false
        isReset = false
    }

    private func getTimeString(from seconds: Int) -> String {
        let minutes = seconds / 60
        let seconds = seconds % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
}
