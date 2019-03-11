//
//  ViewController.swift
//  E-Director
//
//  Created by 徐一鸣 on 3/9/19.
//  Copyright © 2019 SupYiming. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var statisticScroll: UIScrollView!
    
    @IBOutlet weak var firstButton: UIButton!
    
    @IBOutlet weak var secondButton: UIButton!
    
    @IBOutlet weak var thirdButton: UIButton!
    
    @IBOutlet weak var fourthButton: UIButton!
    
    @IBOutlet weak var fifthButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        layoutViews()
        buttonAppearance()
        
        
        
    }
    func layoutViews(){
        
        var constraints = [NSLayoutConstraint]()
        
        //MARK: titleLabel layout constraints
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        //titleLabel.top = view.safeAreaLayoutGuide.top
        constraints += [NSLayoutConstraint.init(item: titleLabel, attribute: .top, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .top, multiplier: 1.0, constant: 0.0)]
        //titleLabel.leading = view.leading
        constraints += [NSLayoutConstraint.init(item: titleLabel, attribute: .leading, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .leading, multiplier: 1.0, constant: 10.0)]
        //titleLabel.trailing = view.trailing
        constraints += [NSLayoutConstraint.init(item: titleLabel, attribute: .trailing, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .trailing, multiplier: 1.0, constant: 0.0)]
        //titleLabel.bottom= scrollview.top
        constraints += [NSLayoutConstraint.init(item: titleLabel, attribute: .bottom, relatedBy: .equal, toItem: statisticScroll, attribute: .top, multiplier: 1.0, constant: 10.0)]
        
        //MARK: statisticScroll layout constraints
        statisticScroll.translatesAutoresizingMaskIntoConstraints = false
        //statisricScroll.leading = view.leading
        constraints += [NSLayoutConstraint.init(item: statisticScroll, attribute: .leading, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .leading, multiplier: 1.0, constant: 0.0)]
        //statisricScroll.trailing = view.trailing
        constraints += [NSLayoutConstraint.init(item: statisticScroll, attribute: .trailing, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .trailing, multiplier: 1.0, constant: 0.0)]
        //statisricScroll.bottom = firstButton.top
        constraints += [NSLayoutConstraint.init(item: statisticScroll, attribute: .bottom, relatedBy: .equal, toItem: firstButton, attribute: .top, multiplier: 1.0, constant: 0.0)]
        
        
        
        //MARK: firstButton layout constraints
        firstButton.translatesAutoresizingMaskIntoConstraints = false
        //firstButton.leading = view.leading
        constraints += [NSLayoutConstraint.init(item: firstButton, attribute: .leading, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .leading, multiplier: 1.0, constant: 0.0)]
        //firstButton.bottom = view.bottom
        constraints += [NSLayoutConstraint.init(item: firstButton, attribute: .bottom, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .bottom, multiplier: 1.0, constant: 0.0)]
        //firstButton.trailing
        constraints += [NSLayoutConstraint.init(item: firstButton, attribute: .trailing, relatedBy: .equal, toItem: secondButton, attribute: .leading, multiplier: 1.0, constant: -10.0)]
        //firstButton.height = 20.0
        constraints += [NSLayoutConstraint.init(item: firstButton, attribute: .height, relatedBy: .lessThanOrEqual, toItem: view, attribute: .height, multiplier: 0.05, constant: 0.0)]


        //MARK: secondButton layout constraints
        secondButton.translatesAutoresizingMaskIntoConstraints = false
        //secondButton.firstBaseline = firstButton.firstBaseline
        constraints += [NSLayoutConstraint.init(item: secondButton, attribute: .firstBaseline, relatedBy: .equal, toItem: firstButton, attribute: .firstBaseline, multiplier: 1.0, constant: 0.0)]
        //secondButton.height = 20.0
        constraints += [NSLayoutConstraint.init(item: secondButton, attribute: .height, relatedBy: .equal, toItem: firstButton, attribute: .height, multiplier: 1.0, constant: 0.0)]
        //width
        constraints += [NSLayoutConstraint.init(item: secondButton, attribute: .width, relatedBy: .equal, toItem: firstButton, attribute: .width, multiplier: 1.0, constant: 0.0)]
        //trailing
        constraints += [NSLayoutConstraint.init(item: secondButton, attribute: .trailing, relatedBy: .equal, toItem: thirdButton, attribute: .leading, multiplier: 1.0, constant: -10.0)]
        
 //MARK: thirdButton layout constraints
        thirdButton.translatesAutoresizingMaskIntoConstraints = false
        //thirdButton.centerX = view.centerX
        constraints += [NSLayoutConstraint.init(item: thirdButton, attribute: .centerX, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .centerX, multiplier: 1.0, constant: 0.0)]
        //thirdButton.firstBaseline = firstButton.firstBaseline
        constraints += [NSLayoutConstraint.init(item: thirdButton, attribute: .firstBaseline, relatedBy: .equal, toItem: firstButton, attribute: .firstBaseline, multiplier: 1.0, constant: 0.0)]
        //thirdButton.height = 20.0
        constraints += [NSLayoutConstraint.init(item: thirdButton, attribute: .height, relatedBy: .equal, toItem: firstButton, attribute: .height, multiplier: 1.0, constant: 0.0)]
//        //width
        constraints += [NSLayoutConstraint.init(item: thirdButton, attribute: .width, relatedBy: .equal, toItem: secondButton, attribute: .width, multiplier: 1.0, constant: 0.0)]
        //trailing
        constraints += [NSLayoutConstraint.init(item: thirdButton, attribute: .trailing, relatedBy: .equal, toItem: fourthButton, attribute: .leading, multiplier: 1.0, constant: -10.0)]
        

        //MARK: fourthButton layout constraints
        fourthButton.translatesAutoresizingMaskIntoConstraints = false
        //fourthButton.trailing = fifthButton.leading
        constraints += [NSLayoutConstraint.init(item: fourthButton, attribute: .trailing, relatedBy: .equal, toItem: fifthButton, attribute: .leading, multiplier: 1.0, constant: -10.0)]
        //fourthButton.firstBaseline = firstButton.firstBaseline
        constraints += [NSLayoutConstraint.init(item: fourthButton, attribute: .firstBaseline, relatedBy: .equal, toItem: firstButton, attribute: .firstBaseline, multiplier: 1.0, constant: 0.0)]
        //fourthButton.height = 20.0
        constraints += [NSLayoutConstraint.init(item: fourthButton, attribute: .height, relatedBy: .equal, toItem: firstButton, attribute: .height, multiplier: 1.0, constant: 0.0)]
        //width
        constraints += [NSLayoutConstraint.init(item: fourthButton, attribute: .width, relatedBy: .equal, toItem: thirdButton, attribute: .width, multiplier: 1.0, constant: 0.0)]
        
        
        //MARK: fifthButton layout constraints
        fifthButton.translatesAutoresizingMaskIntoConstraints = false
        //fifthButton.trailing = view.trailing
        constraints += [NSLayoutConstraint.init(item: fifthButton, attribute: .trailing, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .trailing, multiplier: 1.0, constant: 0.0)]
        //fifthButton.firstBaseline = firstButton.firstBaseline
        constraints += [NSLayoutConstraint.init(item: fifthButton, attribute: .firstBaseline, relatedBy: .equal, toItem: firstButton, attribute: .firstBaseline, multiplier: 1.0, constant: 0.0)]
        //fifthButton.height = 20.0
        constraints += [NSLayoutConstraint.init(item: fifthButton, attribute: .height, relatedBy: .equal, toItem: firstButton, attribute: .height, multiplier: 1.0, constant: 0.0)]
        //fifthButton.width = fourthButton.width
        constraints += [NSLayoutConstraint.init(item: fifthButton, attribute: .width, relatedBy: .equal, toItem: fourthButton, attribute: .width, multiplier: 1.0, constant: 0.0)]
        
        view.addConstraints(constraints)
        
    }
    //settings for the appearance of bottom buttons
    func buttonAppearance(){
        firstButton.backgroundColor = UIColor.lightGray
        secondButton.backgroundColor = UIColor.lightGray
        thirdButton.backgroundColor = UIColor.lightGray
        fourthButton.backgroundColor = UIColor.lightGray
        fifthButton.backgroundColor = UIColor.lightGray
        
        firstButton.setTitle("Selected", for: UIControl.State.selected)
        firstButton.setTitleColor(UIColor.lightGray, for: UIControl.State.selected)
        secondButton.setTitle("Selected", for: UIControl.State.selected)
        thirdButton.setTitle("Selected", for: UIControl.State.selected)
        fourthButton.setTitle("Selected", for: UIControl.State.selected)
        fifthButton.setTitle("Selected", for: UIControl.State.selected)
        
//        self.performSegue(withIdentifier: "showSecondView", sender: secondButton)
        
    }


}

