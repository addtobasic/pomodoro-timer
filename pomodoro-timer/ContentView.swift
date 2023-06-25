//
//  ContentView.swift
//  pomodoro-timer
//
//  Created by genshi on 2023/06/18.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            TabView {
                TimerView(duration: 25 * 60)
                    .tabItem {
                        Image(systemName: "desktopcomputer")
                        Text("25 minutes")
                    }
                TimerView(duration: 5 * 60)
                    .tabItem {
                        Image(systemName: "cup.and.saucer.fill")
                        Text("5 minutes")
                    }
            }
            .accentColor(Theme.mainColor)
        }
        .background(Theme.backgroundColor)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
