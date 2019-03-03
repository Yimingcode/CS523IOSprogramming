//
//  SettingsViewController.swift
//  Director
//
//  Created by 徐一鸣 on 2/28/19.
//  Copyright © 2019 SupYiming. All rights reserved.
//

import UIKit


class SettingsViewController: UIViewController, UITableViewDataSource {
    
    
    
    @IBOutlet weak var settingTable: UITableView!
    
    var settingData:[String] = ["User name     Institute owner", "Instructor Nums:  0", "Classroom Num:   0", "Course Num:    0", "My privilege: Stud, Contract, Financial, Rearrange Classes, Message", "Paid Services", "WeChat Reminder", "My Profile", "Configuration", "PC Server", "Connection with home", "Contact Us", "Message", "Rate us", "Basic Settings"]
   
    
//    var "User name     Institute owner" = settingData[0]
//    settingData.append("Instructor Nums:  0")
//    settingData.append("Classroom Num:   0")
//    settingData.append("Course Num:    0")
//    settingData.append("My privilege: Stud, Contract, Financial, Rearrange Classes, Message")
//    settingData.append("Paid Services")
//    settingData.append("WeChat Reminder")
//    settingData.append("My Profile")
//    settingData.append("Configuration")
//    settingData.append("PC Server")
//    settingData.append("Connection with home")
//    settingData.append("Contact Us")
//    settingData.append("Message")
//    settingData.append("Rate us")
//    settingData.append("Basic Settings")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
       settingTable.dataSource = self
        
    }
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settingData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = UITableViewCell()
        cell.textLabel?.text = settingData[indexPath.row]
        return cell
    }
    
    
        
    }
    
    
    


