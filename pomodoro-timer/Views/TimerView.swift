//
//  TimerView.swift
//  pomodoro-timer
//
//  Created by genshi on 2023/06/21.
//

import SwiftUI

struct TimerView: View {
    @StateObject var timerViewModel: TimerViewModel
    let duration: Int
    
    init(duration: Int) {
        self.duration = duration
        _timerViewModel = StateObject(wrappedValue: TimerViewModel(duration: duration))
    }

    var body: some View {
        VStack {
            Text(timerViewModel.timeString)
                .font(.largeTitle)
                .padding()
                .foregroundColor(Theme.mainColor)
                .background(Theme.backgroundColor)
            
            TimerButtonView()
                .environmentObject(timerViewModel)
        }
    }
}
