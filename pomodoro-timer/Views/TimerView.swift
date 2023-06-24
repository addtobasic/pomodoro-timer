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
            CircleProgressBarView()
                .environmentObject(timerViewModel)
            TimerButtonView()
                .environmentObject(timerViewModel)
                .padding(.top, 20)
        }
    }
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView(duration: 1500)
    }
}
