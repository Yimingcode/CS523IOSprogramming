//
//  FirstViewController.swift
//  TicTacToe
//
//  Created by 徐一鸣 on 3/16/19.
// Copyright © 2019 SupYiming. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var text1: UITextField!
    
    @IBOutlet weak var text2: UITextField!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let secondController = segue.destination as! ViewController
        secondController.receivedString1 = text1.text!
        secondController.receivedString2 = text2.text!
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
