//
//  AlarmManager.swift
//  SampleClock
//
//  Created by 濱田一輝 on 2019/12/30.
//  Copyright © 2019 Kazuki Hamada. All rights reserved.
//

import Foundation
import UserNotifications

class AlarmManager {
    let center = UNUserNotificationCenter.current()
    let content = UNMutableNotificationContent()
    let calendar = Calendar.current
    
    var alarmList: [Alarm] = []
    
    func setNewAlarm(alarm: Alarm) {
        alarmList.append(alarm)
    }
    
    func getNewAlarm() -> Alarm {
        return Alarm()
    }
    
    func removeAlarm(at index: Int) {
        removeNotification(index)
        alarmList.remove(at: index)
    }
    
    func removeNotification(_ index: Int) {
        center.removePendingNotificationRequests(withIdentifiers: [alarmList[index].identifier])
        center.removeDeliveredNotifications(withIdentifiers: [alarmList[index].identifier])
    }
    
    func setNotification(_ index: Int) {
        let alarm = alarmList[index]
        
        content.title = "アラーム"
        content.sound = UNNotificationSound.default
        
        let dateComponent = calendar.dateComponents([.hour, .minute], from: alarm.date)
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponent, repeats: alarm.repeats)
        let request = UNNotificationRequest(identifier: alarm.identifier, content: content, trigger: trigger)

        center.add(request, withCompletionHandler: nil)
    }
}
