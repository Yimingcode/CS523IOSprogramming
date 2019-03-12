//
//  ViewController.swift
//  Images
//
//  Created by Terence on 10/8/16.
//  Copyright © 2016 Yongxin (Terence) Feng. All rights reserved.
//

import UIKit

class ListViewController: UIViewController {

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Show Images" {
            if let ivc = segue.destination as? ImageViewController , let imageName = (sender as? UIButton)?.currentTitle {
                ivc.imageURL = URLs.StevensImages(name: imageName)
                ivc.title = imageName
            }
        }
    }

}

