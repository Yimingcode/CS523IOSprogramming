//
//  ViewController.swift
//  ML
//
//  Created by 徐一鸣 on 4/1/19.
//  Copyright © 2019 SupYiming. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var alcoholLabel: UILabel!
    @IBOutlet weak var alcoholSlider: UISlider!
    @IBOutlet weak var malicAcidLabel: UILabel!
    @IBOutlet weak var malicAcidSlider: UISlider!
    @IBOutlet weak var ashLabel: UILabel!
    @IBOutlet weak var ashSlider: UISlider!
    @IBOutlet weak var alkalinityAshLabel: UILabel!
    @IBOutlet weak var alkalinityAshSlider: UISlider!
    @IBOutlet weak var magnesiumLabel: UILabel!
    @IBOutlet weak var magnesiumSlider: UISlider!
    @IBOutlet weak var totalPhenolsLabel: UILabel!
    @IBOutlet weak var totalPhenolsSlider: UISlider!
    @IBOutlet weak var cultivar1Label: UILabel!
    
    let model = wine()
    let numberFormatter = NumberFormatter()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        stackView.setCustomSpacing(30, after: totalPhenolsSlider)
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumFractionDigits = 2
        updateValues()
    }

    @IBAction func updateValues() {
        DispatchQueue.main.async {
            self.updateLabels()
            self.predictCultivar();
        }
    }
    
    func updateLabels(){
        alcoholLabel.text = "Alcohol: \(numberFormatter.string(for: alcoholSlider.value) ?? "0")"
        malicAcidLabel.text = "Malic Acid: \(numberFormatter.string(for: malicAcidSlider.value) ?? "0")"
        ashLabel.text = "Ash: \(numberFormatter.string(for: ashSlider.value) ?? "0")"
        alkalinityAshLabel.text = "Alkalinity Ash: \(numberFormatter.string(for: alkalinityAshSlider.value) ?? "0")"
        magnesiumLabel.text = "Magnesium: \(numberFormatter.string(for: magnesiumSlider.value) ?? "0")"
        totalPhenolsLabel.text = "Total Phenols: \(numberFormatter.string(for: totalPhenolsSlider.value) ?? "0")"
    }
    
    func predictCultivar() {
        if let prediction = try? model.prediction(alcohol: Double(alcoholSlider.value), malicAcid:
            Double(malicAcidSlider.value), ash: Double(ashSlider.value), alkalinityAsh:
            Double(alkalinityAshSlider.value), magnesium: Double(magnesiumSlider.value), totalPhenols:
            Double(totalPhenolsSlider.value)) {
            cultivar1Label.text = "Cultivar \(prediction.classLabel) (\(prediction.classProbability[prediction.classLabel] ?? 0))"
        }
    }
}

