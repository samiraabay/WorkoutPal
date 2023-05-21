//
//  schedulePickerView.swift
//  WorkoutPal
//
//  Created by Samira Abayasekara on 2023-05-20.
//

import Foundation
import UIKit

class schedulePicker : UIViewController {
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.textAlignment = .center
        label.text = "Create Schedule"
        return label
    }()
    
    let scheduleNameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Schedule Name"
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    let datePicker: UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        return datePicker
    }()
    
    let timePicker: UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .time
        return datePicker
    }()
    
    let durationPicker: UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .countDownTimer
        return datePicker
    }()
    
    let createButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Create Schedule", for: .normal)
        button.addTarget(self, action: #selector(createSchedule), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        titleLabel.frame = CGRect(x: 16, y: 100, width: view.bounds.width - 32, height: 30)
        
        scheduleNameTextField.frame = CGRect(x: 16, y: titleLabel.frame.maxY + 16, width: view.bounds.width - 32, height: 40)
        
        // Set up the time picker
        timePicker.frame = CGRect(x: 16, y: scheduleNameTextField.frame.maxY + 16, width: view.bounds.width - 32, height: 200)
        
        // Set up the create button
        createButton.frame = CGRect(x: 16, y: timePicker.frame.maxY + 16, width: view.bounds.width - 32, height: 40)
        
        // Add the views to the view controller's view
        view.addSubview(titleLabel)
        view.addSubview(scheduleNameTextField)
        view.addSubview(timePicker)
        view.addSubview(createButton)
    }
    
    @objc func createSchedule() {
        // Handle schedule creation
        guard let scheduleName = scheduleNameTextField.text else { return }
        let selectedTime = timePicker.date
        
        print("Schedule Name: \(scheduleName)")
        print("Selected Time: \(selectedTime)")
        
        // Perform any further actions with the schedule data
    }
}
