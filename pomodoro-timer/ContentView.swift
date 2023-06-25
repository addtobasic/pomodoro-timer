//
//  ContentView.swift
//  pomodoro-timer
//
//  Created by genshi on 2023/06/18.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedDuration: Int = 25

    var body: some View {
        VStack {
            Picker("Timer Duration", selection: $selectedDuration) {
                Text("25 Minutes").tag(25)
                Text("5 Minutes").tag(5)
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()

            Spacer()

            // インスタンス更新のために.idを追加
            TimerView(duration: selectedDuration * 60)
                .id(selectedDuration)
            
            Spacer()
        }
        .background(Theme.backgroundColor)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
