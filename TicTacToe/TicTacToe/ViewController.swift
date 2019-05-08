//
//  ViewController.swift
//  TicTacToe
//
//  Created by 徐一鸣 on 3/16/19.
// Copyright © 2019 SupYiming. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label1: UILabel!
    
    @IBOutlet weak var buttonSets: UIButton!
    
    @IBOutlet weak var label2: UILabel!
    
    var receivedString1 = ""
    var receivedString2 = ""
    
    var ticTacToe = TicTacToe()
    @IBOutlet var lblStatus: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        updateState()
        label1.text = receivedString1
        label2.text = receivedString2
        appearance()
    }

    @IBAction func buttonTapped(sender: UIButton) {
        if sender.title(for: .normal) != "-" {
            return
        }
        var btnTextValue: String
        var btnBoardValue: Int
        switch ticTacToe.checkStatus() {
        case .xTern:
            btnTextValue = "X"
            btnBoardValue = 1
        case .oTern:
            btnTextValue = "O"
            btnBoardValue = 2
            
        default:
            btnTextValue = "-"
            btnBoardValue = 0
        }
        ticTacToe.board[(sender.tag-1)/3][(sender.tag-1)%3] = btnBoardValue
        sender.setTitle(btnTextValue, for: .normal)
        updateState()
    }

    @IBAction func btnResetTapped(sender: UIButton) {
        ticTacToe.resetBoard()
        for i in 1...9 {
            let btn = self.view.viewWithTag(i) as! UIButton
            btn.setTitle("-", for: .normal)
        }
        updateState()
    }

    func updateState() {
        lblStatus.text = ticTacToe.checkStatus().rawValue
    }
    
    func appearance() {
//        buttonSets.setTitleColor(UIColor.lightGray, for: .normal)
//        buttonSets.setTitleColor(UIColor.black, for: .init(rawValue: 1))
        
    }

}

