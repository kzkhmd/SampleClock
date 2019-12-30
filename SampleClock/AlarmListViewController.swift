//
//  AlarmListViewController.swift
//  SampleClock
//
//  Created by 濱田一輝 on 2019/12/15.
//  Copyright © 2019 Kazuki Hamada. All rights reserved.
//

import UIKit

class AlarmListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var AlarmTableView: UITableView!
    
    var AlarmList:[String] = [
        "1",
        "2",
        "3"
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        AlarmTableView.delegate   = self
        AlarmTableView.dataSource = self
    }
    
    // MARK: - Table view data source
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return AlarmList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let AlarmCell = tableView.dequeueReusableCell(withIdentifier: "AlarmCell", for: indexPath)
        let AlarmData = AlarmList[(indexPath as NSIndexPath).row]
        
        AlarmCell.textLabel?.text = AlarmData
        
        return AlarmCell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
}

