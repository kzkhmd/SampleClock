//
//  AlarmManager.swift
//  SampleClock
//
//  Created by 濱田一輝 on 2019/12/30.
//  Copyright © 2019 Kazuki Hamada. All rights reserved.
//

import Foundation

class AlarmManager {
    var alarmList: [Alarm] = []
    
    func setNewAlarm(alarm: Alarm) {
        alarmList.append(alarm)
    }
    
    func getNewAlarm() -> Alarm {
        return Alarm()
    }
    
    func removeAlarm(at index: Int) {
        alarmList.remove(at: index)
    }
}
