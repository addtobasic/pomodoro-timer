//
//  ContentView.swift
//  pomodoro-timer
//
//  Created by genshi on 2023/06/18.
//

import SwiftUI

struct ContentView: View {

    var body: some View {
        HStack{
            TimerView(duration: 1500)
                .navigationTitle("Timer App")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
