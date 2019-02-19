//
//  SecondPage.swift
//  DataPass
//
//  Created by 徐一鸣 on 2/11/19.
//  Copyright © 2019 SupYiming. All rights reserved.
//

import UIKit

class SecondController: UIViewController {
    
    
    @IBOutlet weak var MyLabel: UILabel!
    
    
    var receivedString = ""
    
    @IBAction func MySecond(_ sender: Any) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
         MyLabel.text = receivedString
    }
    
    
}
