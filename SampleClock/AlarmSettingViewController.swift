//
//  AlarmSettingViewController.swift
//  SampleClock
//
//  Created by 濱田一輝 on 2019/12/29.
//  Copyright © 2019 Kazuki Hamada. All rights reserved.
//

import UIKit

class AlarmSettingViewController: UIViewController {
    
    @IBOutlet weak var alarmTimePicker: UIDatePicker!
    
    var alarmManager: AlarmManager?
    var alarm: Alarm?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if let alarm = alarm {
            alarmTimePicker.date = alarm.date
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        self.presentingViewController?.beginAppearanceTransition(true, animated: animated)
        self.presentingViewController?.endAppearanceTransition()
    }
    
    // キャンセルボタン押下時の処理
    @IBAction func onTapCancelButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    // 保存ボタン押下時の処理
    @IBAction func onTapSaveButton(_ sender: Any) {
        alarm?.date = alarmTimePicker.date
        alarmManager?.setNewAlarm(alarm: alarm!)
        
        self.dismiss(animated: true, completion: nil)
    }
}
