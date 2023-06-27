//
//  DeviceSize.swift
//  pomodoro-timer
//
//  Created by genshi on 2023/06/27.
//

import Foundation
import Combine
import SwiftUI

struct DeviceSize {
    static let isPhone = UIScreen.main.bounds.size.width < 600
}
