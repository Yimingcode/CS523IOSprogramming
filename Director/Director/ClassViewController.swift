//
//  ClassViewController.swift
//  Director
//
//  Created by 徐一鸣 on 2/28/19.
//  Copyright © 2019 SupYiming. All rights reserved.
//

import UIKit

class ClassViewController: UIViewController, UISearchBarDelegate {

    @IBOutlet weak var classNameSearchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        classNameSearchBar.delegate = self

        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    classNameSearchBar.resignFirstResponder()
        
        
    }
    
   

}
