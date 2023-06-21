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
                .font(.title)
                .padding()
                .background(Color.green)
                .foregroundColor(.white)
                .cornerRadius(10)
            
            Button(action: {
                timerViewModel.startTimer(with: 60)
            }) {
                Text("Start")
                    .font(.title)
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            
            
            Button(action: {
                timerViewModel.stopTimer()
            }) {
                Text("Stop")
                    .font(.title)
                    .padding()
                    .background(Color.red)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }
    }
}
