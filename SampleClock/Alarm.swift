//
//  Alarm.swift
//  SampleClock
//
//  Created by 濱田一輝 on 2019/12/30.
//  Copyright © 2019 Kazuki Hamada. All rights reserved.
//

import Foundation

class Alarm: NSObject, NSSecureCoding {
    static var supportsSecureCoding: Bool = true
    
    var identifier: String
    var date: Date = Date()
    var repeats: Bool = true
    var isActive: Bool = false
    
    override init() {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .medium
        
        self.identifier = formatter.string(from: Date())
    }
    
    required init?(coder: NSCoder) {
        self.identifier = coder.decodeObject(forKey: "identifier") as! String
        self.date = coder.decodeObject(forKey: "date") as! Date
        self.repeats = coder.decodeObject(forKey: "repeats") as! Bool
        self.isActive = coder.decodeObject(forKey: "isActive") as! Bool
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(identifier, forKey: "identifier")
        coder.encode(date, forKey: "date")
        coder.encode(repeats, forKey: "repeats")
        coder.encode(isActive, forKey: "isActive")
    }
}
