//
//  DetailViewController.swift
//  Notebook
//
//  Created by 徐一鸣 on 3/11/19.
//  Copyright © 2019 SupYiming. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    
    var text:String = ""
    var masterView: ViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textView.text = text
        
        navigationItem.largeTitleDisplayMode = .never
        
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        textView.becomeFirstResponder()
        masterView.newTextRow = textView.text
    }
    
    
    func setText(t:String) {
        text = t
        if isViewLoaded{
            
            textView.text = t
        }
        
        
    }

    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        masterView.newTextRow = textView.text
        textView.resignFirstResponder()
        
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
