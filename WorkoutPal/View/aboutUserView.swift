//
//  aboutUserView.swift
//  WorkoutPal
//
//  Created by Samira Abayasekara on 2023-05-17.
//

import Foundation
import UIKit

class AboutUserView: UIViewController {
    
    // UI elements
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Name: "
        label.font = UIFont.systemFont(ofSize: 18)
        return label
    }()
    
    let nameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "enter name"
        textField.font = UIFont.systemFont(ofSize: 18)
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    let ageLabel: UILabel = {
        let label = UILabel()
        label.text = "Age: "
        label.font = UIFont.systemFont(ofSize: 18)
        return label
    }()
    
    let ageTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = age
        textField.font = UIFont.systemFont(ofSize: 18)
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    let heightLabel: UILabel = {
        let label = UILabel()
        label.text = "Height (cm): "
        label.font = UIFont.systemFont(ofSize: 18)
        return label
    }()
    
    let heightTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = height
        textField.font = UIFont.systemFont(ofSize: 18)
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    let weightLabel: UILabel = {
        let label = UILabel()
        label.text = "Weight (kg): "
        label.font = UIFont.systemFont(ofSize: 18)
        return label
    }()
    
    let weightTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = weight
        textField.font = UIFont.systemFont(ofSize: 18)
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    let goalLabel: UILabel = {
        let label = UILabel()
        label.text = "Goal: "
        label.font = UIFont.systemFont(ofSize: 18)
        return label
    }()
    
    let goalTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = goal
        textField.font = UIFont.systemFont(ofSize: 18)
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    let levelLabel: UILabel = {
        let label = UILabel()
        label.text = "Level: "
        label.font = UIFont.systemFont(ofSize: 18)
        return label
    }()
    
    let levelTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = level
        textField.font = UIFont.systemFont(ofSize: 18)
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    let saveButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Save", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        let nameStack = UIStackView(arrangedSubviews: [nameLabel, nameTextField])
        nameStack.axis = .horizontal
        nameStack.spacing = 30
        nameStack.translatesAutoresizingMaskIntoConstraints = false
        
        let ageStack = UIStackView(arrangedSubviews: [ageLabel, ageTextField])
        ageStack.axis = .horizontal
        ageStack.spacing = 30
        ageStack.translatesAutoresizingMaskIntoConstraints = false
        
        let heightStack = UIStackView(arrangedSubviews: [heightLabel, heightTextField])
        heightStack.axis = .horizontal
        heightStack.spacing = 30
        heightStack.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(heightStack)
        
        let weightStack = UIStackView(arrangedSubviews: [weightLabel, weightTextField])
        weightStack.axis = .horizontal
        weightStack.spacing = 30
        weightStack.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(weightStack)
        
        let goalStack = UIStackView(arrangedSubviews: [goalLabel, goalTextField])
        goalStack.axis = .horizontal
        goalStack.spacing = 30
        goalStack.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(goalStack)
        
        let levelStack = UIStackView(arrangedSubviews: [levelLabel, levelTextField])
        levelStack.axis = .horizontal
        levelStack.spacing = 30
        levelStack.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(levelStack)
        
        let stackView = UIStackView(arrangedSubviews: [nameStack, ageStack, heightStack, weightStack, goalStack, levelStack, saveButton])
        stackView.axis = .vertical
        stackView.spacing = 35
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)
        
        // Set up constraints
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    // Action when the save button is tapped
    @objc func saveButtonTapped() {
        // Update user data with the values entered in text fields
        
        // Display an alert or perform navigation as needed
        let alert = UIAlertController(title: "Saved", message: "User data has been saved.", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
}
