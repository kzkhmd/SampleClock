//
//  AlarmSettingViewController.swift
//  SampleClock
//
//  Created by 濱田一輝 on 2019/12/29.
//  Copyright © 2019 Kazuki Hamada. All rights reserved.
//

import UIKit

class AlarmSettingViewController: UIViewController {
    
    @IBOutlet weak var AlarmTimePicer: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func onTouchCancelButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func onTouchDoneButton(_ sender: Any) {
        print(AlarmTimePicer.date)
        self.dismiss(animated: true, completion: nil)
    }
    
}
