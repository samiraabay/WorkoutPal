//
//  SummaryView.swift
//  WorkoutPal
//
//  Created by Samira Abayasekara on 2023-05-15.
//

import Foundation
import UIKit

public var bmi : String = "";

class summaryView : UIViewController {
    
    let questionLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 26, weight: .bold)
        label.text = "Is This Correct?"
        label.textAlignment = .center
        return label
    }()
    
    let nameLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 24, weight: .thin)
        label.text = "My Name is \(uname)"
        label.textAlignment = .center
        return label
    }()
    
    let genderLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 24, weight: .thin)
        label.text = "I am a \(gender)"
        label.textAlignment = .center
        return label
    }()
    
    let ageLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 24, weight: .thin)
        label.text = "I am \(age) years old"
        label.textAlignment = .center
        return label
    }()
    
    let weightLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 24, weight: .thin)
        label.text = "My weight is \(weight)"
        label.textAlignment = .center
        return label
    }()
    
    let weightUnitLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 24, weight: .thin)
        label.text = "\(weightUnit)"
        label.textAlignment = .center
        return label
    }()
    
    var heightLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 24, weight: .thin)
        label.text = "I Am \(height)"
        label.textAlignment = .center
        return label
    }()
    
    var heightUnitLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 24, weight: .thin)
        label.text = "\(heightUnit) tall"
        label.textAlignment = .center
        return label
    }()
    
    var levelLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 24, weight: .thin)
        label.text = "I am a \(level)"
        label.textAlignment = .center
        return label
    }()
    
    var goalLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 24, weight: .thin)
        label.text = "My goal is to \(goal)"
        label.textAlignment = .center
        return label
    }()
    
    var bmiLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 24, weight: .thin)
        label.text = "My BMI value is \(bmi)"
        label.textAlignment = .center
        return label
    }()
    
    let hStack1 : UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.spacing = 3
        return stack
    }()
    
    let hStack2 : UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.spacing = 3
        return stack
    }()
    
    let buttonCont : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Continue", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .semibold)
        button.backgroundColor = UIColor(red: 69/255, green: 90/255, blue: 100/255, alpha: 1.0)
        button.layer.cornerRadius = 10
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text = uname
        genderLabel.text = gender
        ageLabel.text = age
        weightLabel.text = weight
        weightUnitLabel.text = weightUnit
        heightLabel.text = height
        heightUnitLabel.text = heightUnit
        levelLabel.text = level
        goalLabel.text = goal
        
        setupUI()
    }
    
    func setupUI(){
        view.backgroundColor = .white
        view.addSubview(questionLabel)
        view.addSubview(nameLabel)
        view.addSubview(genderLabel)
        view.addSubview(ageLabel)
        view.addSubview(hStack1)
        view.addSubview(hStack2)
        view.addSubview(levelLabel)
        view.addSubview(goalLabel)
        view.addSubview(bmiLabel)
        view.addSubview(buttonCont)
        
        hStack1.addArrangedSubview(weightLabel)
        hStack1.addArrangedSubview(weightUnitLabel)
        
        hStack2.addArrangedSubview(heightLabel)
        hStack2.addArrangedSubview(heightUnitLabel)
        
        buttonCont.addTarget(self, action: #selector(goHome), for: .touchUpInside)
        
        
        NSLayoutConstraint.activate([
            
            questionLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            questionLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            questionLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            questionLabel.heightAnchor.constraint(equalToConstant: 60),
            
            nameLabel.topAnchor.constraint(equalTo: questionLabel.bottomAnchor, constant: 10),
            nameLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            nameLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            nameLabel.heightAnchor.constraint(equalToConstant: 40),
            
            genderLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
            genderLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            genderLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            genderLabel.heightAnchor.constraint(equalToConstant: 40),
            
            ageLabel.topAnchor.constraint(equalTo: genderLabel.bottomAnchor, constant: 10),
            ageLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            ageLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            ageLabel.heightAnchor.constraint(equalToConstant: 40),
            
            hStack1.topAnchor.constraint(equalTo: ageLabel.bottomAnchor, constant: 10),
            hStack1.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            hStack2.topAnchor.constraint(equalTo: hStack1.bottomAnchor, constant: 10),
            hStack2.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            levelLabel.topAnchor.constraint(equalTo: hStack2.bottomAnchor, constant: 10),
            levelLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            levelLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            levelLabel.heightAnchor.constraint(equalToConstant: 40),
            
            goalLabel.topAnchor.constraint(equalTo: levelLabel.bottomAnchor, constant: 10),
            goalLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            goalLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            goalLabel.heightAnchor.constraint(equalToConstant: 40),
            
            bmiLabel.topAnchor.constraint(equalTo: goalLabel.bottomAnchor, constant: 10),
            bmiLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            bmiLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            bmiLabel.heightAnchor.constraint(equalToConstant: 40),
            
            buttonCont.topAnchor.constraint(equalTo: goalLabel.bottomAnchor, constant: 60),
            buttonCont.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonCont.heightAnchor.constraint(equalToConstant: 50),
            buttonCont.widthAnchor.constraint(equalToConstant: 225),
        ])
    }
    
    @objc func goHome(){
        let vc = NavBar()
        navigationController?.pushViewController(vc, animated: true)
    }
}
