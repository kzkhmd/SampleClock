//
//  AlarmListViewController.swift
//  SampleClock
//
//  Created by 濱田一輝 on 2019/12/15.
//  Copyright © 2019 Kazuki Hamada. All rights reserved.
//

import UIKit

class AlarmListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var alarmTableView: UITableView!
    
    let formatter = DateFormatter()
    var alarmManager = AlarmManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        alarmTableView.delegate   = self
        alarmTableView.dataSource = self
        
        formatter.dateFormat = "HH:mm"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.alarmTableView.reloadData()
    }
    
    // MARK: - Table view data source
    
    // セクション数を返す
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // セクションごとの行数を返す
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return alarmManager.alarmList.count
    }
    
    // 各行に表示するセルを返す
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let alarmCell = tableView.dequeueReusableCell(withIdentifier: "AlarmCell", for: indexPath)
        let alarmData = alarmManager.alarmList[(indexPath as NSIndexPath).row]
        
        alarmCell.textLabel?.text = formatter.string(from: alarmData.date)
        
        return alarmCell
    }
    
    // セルをスワイプしたときの処理
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            alarmManager.removeAlarm(at: indexPath.row)
            alarmTableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AlarmSettingSegue" {
            let alarmSettingViewController = segue.destination as! AlarmSettingViewController
            
            if let indexPath = self.alarmTableView.indexPathForSelectedRow {
                alarmSettingViewController.alarmManager = alarmManager
                alarmSettingViewController.alarm = alarmManager.alarmList[(indexPath as NSIndexPath).row]
            } else {
                alarmSettingViewController.alarmManager = alarmManager
                alarmSettingViewController.alarm = alarmManager.getNewAlarm()
            }
        }
    }
    
}

