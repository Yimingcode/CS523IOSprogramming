//
//  DetailStudentViewController.swift
//  E-Director
//
//  Created by 徐一鸣 on 3/11/19.
//  Copyright © 2019 SupYiming. All rights reserved.
//

import UIKit

class DetailStudentViewController: UIViewController {

    @IBOutlet weak var studentText: UITextView!
    
    var text:String = ""
    
    var masterView:studentViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        studentText.text = text
        
        self.navigationItem.largeTitleDisplayMode = .never
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        studentText.becomeFirstResponder()
    }
    
    func setText(t:String) {
        text = t
        if isViewLoaded{
            
            studentText.text = t
        
        }
        
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        masterView.newRowText = studentText.text
        studentText.resignFirstResponder()
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
