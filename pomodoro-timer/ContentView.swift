//
//  ContentView.swift
//  pomodoro-timer
//
//  Created by genshi on 2023/06/18.
//

import SwiftUI

struct ContentView: View {
    @StateObject var timerViewModel = TimerViewModel()

    var body: some View {
            TimerView()
                .navigationTitle("Timer App")
                .environmentObject(timerViewModel)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
