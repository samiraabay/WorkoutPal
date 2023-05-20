//
//  SummaryView.swift
//  WorkoutPal
//
//  Created by Samira Abayasekara on 2023-05-15.
//

import Foundation
import UIKit

class summaryView : UIViewController {
    
    var genderLabel : UILabel
    var ageLabel : UILabel
    var weightLabel : UILabel
    var weightUnitLabel : UILabel
    var heightLabel : UILabel
    var heightUnitLabel : UILabel
    var levelLabel : UILabel
    var goalLabel : UILabel
    
    required  init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        genderLabel.text = gender
        ageLabel.text = age
        weightLabel.text = weight
        weightUnitLabel.text = weightUnit
        heightLabel.text = height
        heightUnitLabel.text = heightUnit
        levelLabel.text = level
        goalLabel.text = goal
    }
}
