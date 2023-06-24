//
//  AVPlayer+Bell.swift
//  pomodoro-timer
//
//  Created by genshi on 2023/06/24.
//

import Foundation
import AVFoundation

extension AVPlayer {
    static let sharedBellPlayer:AVPlayer = {
        guard let url = Bundle.main.url(forResource: "bell", withExtension: "mp3") else {
            fatalError("Failed to find sound file.") }
        
        return AVPlayer(url: url)
    }()
    
    func playBellSound() {
        seek(to: .zero)
        play()
    }
    
    func stopBellSound() {
        pause()
    }
}
