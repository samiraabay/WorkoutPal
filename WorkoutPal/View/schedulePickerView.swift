//
//  schedulePickerView.swift
//  WorkoutPal
//
//  Created by Samira Abayasekara on 2023-05-20.
//

import Foundation
import UIKit
import UserNotifications

class SchedulePicker: UIViewController {
    
    let dateLabel: UILabel = {
        let label = UILabel()
        label.text = "Date:"
        return label
    }()
    
    let datePicker: UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        return datePicker
    }()
    
    let timeLabel: UILabel = {
        let label = UILabel()
        label.text = "Time:"
        return label
    }()
    
    let timePicker: UIDatePicker = {
        let timePicker = UIDatePicker()
        timePicker.datePickerMode = .time
        return timePicker
    }()
    
    let durationLabel: UILabel = {
        let label = UILabel()
        label.text = "Duration (in minutes):"
        return label
    }()
    
    let durationTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Duration"
        textField.keyboardType = .numberPad
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    let saveButton: UIButton = {
        let button = UIButton()
        button.setTitle("Save", for: .normal)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        // Add subviews
        view.addSubview(dateLabel)
        view.addSubview(datePicker)
        view.addSubview(timeLabel)
        view.addSubview(timePicker)
        view.addSubview(durationLabel)
        view.addSubview(durationTextField)
        view.addSubview(saveButton)
        
        // Set up constraints
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        timePicker.translatesAutoresizingMaskIntoConstraints = false
        durationLabel.translatesAutoresizingMaskIntoConstraints = false
        durationTextField.translatesAutoresizingMaskIntoConstraints = false
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            // Date Label
            dateLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            dateLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            
            // Date Picker
            datePicker.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 8),
            datePicker.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            datePicker.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            
            // Time Label
            timeLabel.topAnchor.constraint(equalTo: datePicker.bottomAnchor, constant: 16),
            timeLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            
            // Time Picker
            timePicker.topAnchor.constraint(equalTo: timeLabel.bottomAnchor, constant: 8),
            timePicker.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            timePicker.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            
            // Duration Label
            durationLabel.topAnchor.constraint(equalTo: timePicker.bottomAnchor, constant: 16),
            durationLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            
            // Duration Text Field
            durationTextField.topAnchor.constraint(equalTo: durationLabel.bottomAnchor, constant: 8),
            durationTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            durationTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            
            // Save Button
            saveButton.topAnchor.constraint(equalTo: durationTextField.bottomAnchor, constant: 20),
            saveButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            saveButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            saveButton.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
    
    @objc func saveButtonTapped() {
        // Get the selected date and time from the date picker and time picker
        let selectedDate = datePicker.date
        let selectedTime = timePicker.date
        
        // Get the duration from the text field
        guard let durationString = durationTextField.text, let duration = Int(durationString) else {
            // Show an alert if the duration is not a valid integer
            showAlert(message: "Please enter a valid duration.")
            return
        }
        
        // Combine the date and time components into a single date
        let calendar = Calendar.current
        let dateComponents = calendar.dateComponents([.year, .month, .day], from: selectedDate)
        let timeComponents = calendar.dateComponents([.hour, .minute], from: selectedTime)
        var combinedComponents = DateComponents()
        combinedComponents.year = dateComponents.year
        combinedComponents.month = dateComponents.month
        combinedComponents.day = dateComponents.day
        combinedComponents.hour = timeComponents.hour
        combinedComponents.minute = timeComponents.minute
        
        if let scheduledDate = calendar.date(from: combinedComponents) {
            // Create a notification content
            let content = UNMutableNotificationContent()
            content.title = "Reminder"
            content.body = "Don't forget to do your workout!"
            content.sound = .default
            
            // Create a trigger for the notification based on the scheduled date
            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: scheduledDate.timeIntervalSinceNow, repeats: false)
            
            // Create a request for the notification
            let request = UNNotificationRequest(identifier: "WorkoutReminder", content: content, trigger: trigger)
            
            // Schedule the notification
            UNUserNotificationCenter.current().add(request) { (error) in
                if let error = error {
                    print("Error scheduling notification: \(error)")
                } else {
                    print("Notification scheduled successfully.")
                }
            }
        }
    }
    
    func showAlert(message: String) {
        let alert = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}
