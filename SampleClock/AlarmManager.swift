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
    let userdefault = UserDefaults.standard
    
    var alarmList: [Alarm] = []
    
    init() {
        if let list = loadData() {
            alarmList = list
        }
        else {
            alarmList = []
        }
        
        print(alarmList)
    }
    
    func loadData() -> [Alarm]? {
        if let loadedData = userdefault.data(forKey: "alarmList") {
            return try? NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(loadedData) as! [Alarm]?
        }
        else {
            return nil
        }
    }
    
    func setArchivedData() {
        guard let archivedData = try? NSKeyedArchiver.archivedData(withRootObject: alarmList, requiringSecureCoding: true) else {
            fatalError("Archive Faild")
        }
        
        userdefault.set(archivedData, forKey: "alarmList")
    }
    
    func setNewAlarm(alarm: Alarm) {
        alarmList.append(alarm)
        setArchivedData()
    }
    
    func getNewAlarm() -> Alarm {
        return Alarm()
    }
    
    func removeAlarm(at index: Int) {
        removeNotification(index)
        alarmList.remove(at: index)
        setArchivedData()
    }
        
    
    func removeNotification(_ index: Int) {
        center.removePendingNotificationRequests(withIdentifiers: [alarmList[index].identifier])
        center.removeDeliveredNotifications(withIdentifiers: [alarmList[index].identifier])
        
        printNotifications()
    }
    
    func setNotification(_ index: Int) {
        let alarm = alarmList[index]
        
        content.title = "アラーム"
        content.sound = UNNotificationSound.default
        
        let dateComponent = calendar.dateComponents([.hour, .minute], from: alarm.date)
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponent, repeats: alarm.repeats)
        let request = UNNotificationRequest(identifier: alarm.identifier, content: content, trigger: trigger)

        center.add(request, withCompletionHandler: nil)
        
        printNotifications()
        
    }
    
    func printNotifications() {
        center.getPendingNotificationRequests(completionHandler: {(requests) in
            print("==========Pending Notification============")
            print(requests)
        })
        
        center.getDeliveredNotifications(completionHandler: {(notifications) in
            print("==========Delivered Notification============")
            print(notifications)
        })
    }
}
