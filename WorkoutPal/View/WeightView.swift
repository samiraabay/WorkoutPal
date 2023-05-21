//
//  WeightView.swift
//  WorkoutPal
//
//  Created by Samira Abayasekara on 2023-05-15.
//

import Foundation
import UIKit

public var weight : String = ""
public var weightUnit : String = ""

class weightView: UIViewController {
    
    let labelOne : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 14, weight: .semibold)
        label.textColor = UIColor(red: 140/255, green: 140/255, blue: 140/255, alpha: 1.0)
        label.text = "Step 4/7"
        label.textAlignment = .center
        return label
    }()
    
    let labelTwo : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 36, weight: .thin)
        label.text = "What's"
        label.textAlignment = .center
        return label
    }()
    
    let labelThree : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 36, weight: .thin)
        label.text = "your weight?"
        label.textAlignment = .center
        return label
    }()
    
    let imageAge: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "weight"))
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let labelFour : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 36, weight: .thin)
        label.text = "I"
        label.textAlignment = .center
        return label
    }()
    
    let labelFive : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 36, weight: .thin)
        label.text = "Am"
        label.textAlignment = .center
        return label
    }()
    
    let textField : UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = .roundedRect
        textField.placeholder = "60"
        textField.textAlignment = .center
        textField.keyboardType = .numberPad
        textField.font = .systemFont(ofSize: 36, weight: .semibold)
        textField.backgroundColor = .white
        textField.layer.borderWidth = 1.0
        textField.layer.cornerRadius = 10
        textField.textColor = .black
        return textField
    }()
    
    let buttonKg : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("kg", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 28, weight: .bold)
        button.backgroundColor = UIColor(red: 204/255, green: 190/255, blue: 248/255, alpha: 1.0)
        button.titleLabel?.textColor = .white
        button.layer.cornerRadius = 10
        return button
    }()
    
    let buttonLbs : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("lbs", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 28, weight: .bold)
        button.backgroundColor = UIColor(red: 204/255, green: 190/255, blue: 248/255, alpha: 1.0)
        button.titleLabel?.textColor = .white
        button.layer.cornerRadius = 10
        return button
    }()
    
    let hStack : UIStackView = {
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

        setupUI()
    }
    
    func setupUI(){
        view.backgroundColor = .white
        view.addSubview(labelOne)
        view.addSubview(labelTwo)
        view.addSubview(labelThree)
        view.addSubview(imageAge)
        view.addSubview(labelFour)
        view.addSubview(labelFive)
        view.addSubview(textField)
        
        hStack.addArrangedSubview(buttonKg)
        hStack.addArrangedSubview(buttonLbs)
        
        view.addSubview(hStack)
        view.addSubview(buttonCont)
        
        //Button actions
        
        buttonKg.addTarget(self, action: #selector(btnKg), for: .touchUpInside)
        buttonLbs.addTarget(self, action: #selector(btnLbs), for: .touchUpInside)
        buttonCont.addTarget(self, action: #selector(getHeight), for: .touchUpInside)
        
        //Constraints

        NSLayoutConstraint.activate([
            labelOne.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            labelOne.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            labelOne.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            
            labelTwo.topAnchor.constraint(equalTo: labelOne.bottomAnchor, constant: 10),
            labelTwo.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            labelTwo.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            labelTwo.heightAnchor.constraint(equalToConstant: 40),
            
            labelThree.topAnchor.constraint(equalTo: labelTwo.bottomAnchor),
            labelThree.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            labelThree.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            labelThree.heightAnchor.constraint(equalToConstant: 40),
            
            imageAge.topAnchor.constraint(equalTo: labelThree.bottomAnchor, constant:10),
            imageAge.heightAnchor.constraint(equalToConstant: 200),
            imageAge.widthAnchor.constraint(equalToConstant: 240),
            imageAge.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            labelFour.topAnchor.constraint(equalTo: imageAge.bottomAnchor, constant: 20),
            labelFour.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            labelFour.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -180),
            labelFour.heightAnchor.constraint(equalToConstant: 35),
            
            labelFive.topAnchor.constraint(equalTo: labelFour.bottomAnchor, constant: 10),
            labelFive.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            labelFive.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -180),
            labelFive.heightAnchor.constraint(equalToConstant: 35),
            
            textField.topAnchor.constraint(equalTo: imageAge.bottomAnchor, constant: 27),
            textField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 180),
            textField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -100),
            textField.heightAnchor.constraint(equalToConstant: 75),
            textField.widthAnchor.constraint(equalToConstant: 100),
            
            hStack.topAnchor.constraint(equalTo: labelFive.bottomAnchor, constant: 20),
            hStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonKg.heightAnchor.constraint(equalToConstant: 55),
            buttonKg.widthAnchor.constraint(equalToConstant: 70),
            buttonLbs.heightAnchor.constraint(equalToConstant: 55),
            buttonLbs.widthAnchor.constraint(equalToConstant: 70),
            
            buttonCont.topAnchor.constraint(equalTo: buttonKg.bottomAnchor, constant: 20),
            buttonCont.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonCont.heightAnchor.constraint(equalToConstant: 50),
            buttonCont.widthAnchor.constraint(equalToConstant: 225),
        ])
    }
    
    @objc func btnKg(){
        buttonKg.backgroundColor = UIColor(red: 182/255, green: 162/255, blue: 245/255, alpha: 1.0)
        buttonLbs.backgroundColor = UIColor(red: 204/255, green: 190/255, blue: 248/255, alpha: 1.0)
        
        weightUnit = "kg"
    }
    
    @objc func btnLbs(){
        buttonLbs.backgroundColor = UIColor(red: 182/255, green: 162/255, blue: 245/255, alpha: 1.0)
        buttonKg.backgroundColor = UIColor(red: 204/255, green: 190/255, blue: 248/255, alpha: 1.0)
        
        weightUnit = "lbs"
    }
    
    //button action
    
    @objc func getHeight(){
        weight = textField.text!
        if (weight == "") {
            let alert = UIAlertController(title: "Error", message: "Please enter weight", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(okAction)
            present(alert, animated: true, completion: nil)
        }
        else if (weightUnit == "") {
            let alert = UIAlertController(title: "Error", message: "Please select weight unit", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(okAction)
            present(alert, animated: true, completion: nil)
        }
        else{
            let vc = heightView()
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}
