//
//  Alarm.swift
//  SampleClock
//
//  Created by 濱田一輝 on 2019/12/30.
//  Copyright © 2019 Kazuki Hamada. All rights reserved.
//

import Foundation

class Alarm {
    var identifier: String
    var date: Date = Date()
    var repeats: Bool = true
    var isActive: Bool = false
    
    init() {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .medium
        
        identifier = formatter.string(from: Date())
    }
}
