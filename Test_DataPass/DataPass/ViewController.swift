//
//  ViewController.swift
//  DataPass
//
//  Created by 徐一鸣 on 2/11/19.
//  Copyright © 2019 SupYiming. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var MyText: UITextField!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         let secondController = segue.destination as! SecondController
         secondController.receivedString = MyText.text!
    }

    
    
    
    @IBAction func MyButton(_ sender: Any) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

