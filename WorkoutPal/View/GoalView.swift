//
//  GoalView.swift
//  WorkoutPal
//
//  Created by Samira Abayasekara on 2023-05-15.
//

import Foundation
import UIKit

public var goal : String = ""

class goalView: UIViewController {
    
    //UI Comps
    
    let labelOne : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 14, weight: .semibold)
        label.textColor = UIColor(red: 140/255, green: 140/255, blue: 140/255, alpha: 1.0)
        label.text = "Step 6/6"
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
        label.text = "your goal?"
        label.textAlignment = .center
        return label
    }()
    
    let image : UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "goal"))
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
        label.text = "Plan"
        label.textAlignment = .center
        return label
    }()
    
    let labelSix : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 36, weight: .thin)
        label.text = "To"
        label.textAlignment = .center
        return label
    }()
    
    let buttonLoose : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Loose weight", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 26, weight: .light)
        button.layer.borderWidth = 1.0
        button.backgroundColor = .white
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 10
        return button
    }()
    
    let buttonGain : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Gain muscles", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 26, weight: .light)
        button.layer.borderWidth = 1.0
        button.backgroundColor = .white
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 10
        return button
    }()
    
    let vStack : UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 10
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
        view.addSubview(image)
        view.addSubview(labelFour)
        view.addSubview(labelFive)
        view.addSubview(labelSix)
        
        vStack.addArrangedSubview(buttonLoose)
        vStack.addArrangedSubview(buttonGain)
        
        view.addSubview(vStack)
        view.addSubview(buttonCont)
        
        //Button actions
        
        buttonLoose.addTarget(self, action: #selector(btnL), for: .touchUpInside)
        buttonGain.addTarget(self, action: #selector(btnG), for: .touchUpInside)
        //buttonCont.addTarget(self, action: #selector(getSummary), for: .touchUpInside)
        
        
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
            labelThree.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            labelThree.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            labelThree.heightAnchor.constraint(equalToConstant: 40),
            
            image.topAnchor.constraint(equalTo: labelThree.bottomAnchor, constant: 10),
            image.heightAnchor.constraint(equalToConstant: 200),
            image.widthAnchor.constraint(equalToConstant: 200),
            image.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            labelFour.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 12),
            labelFour.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            labelFour.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -180),
            labelFour.heightAnchor.constraint(equalToConstant: 40),
            
            labelFive.topAnchor.constraint(equalTo: labelFour.bottomAnchor, constant: 20),
            labelFive.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            labelFive.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -180),
            labelFive.heightAnchor.constraint(equalToConstant: 40),
            
            labelSix.topAnchor.constraint(equalTo: labelFive.bottomAnchor, constant: 10),
            labelSix.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            labelSix.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -180),
            labelSix.heightAnchor.constraint(equalToConstant: 40),
            
            
            vStack.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 35),
            vStack.leadingAnchor.constraint(equalTo: labelFive.trailingAnchor, constant: -20),
            vStack.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -40),
            
            buttonCont.topAnchor.constraint(equalTo: labelSix.bottomAnchor, constant: 35),
            buttonCont.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonCont.heightAnchor.constraint(equalToConstant: 50),
            buttonCont.widthAnchor.constraint(equalToConstant: 227),
        ])
    }
    
    @objc func btnL(){
        buttonLoose.backgroundColor = UIColor(red: 255/255, green: 114/255, blue: 94/255, alpha: 1.0)
        buttonGain.backgroundColor = .white
        
        buttonLoose.setTitleColor(.white, for: .normal)
        buttonGain.setTitleColor(.black, for: .normal)
        
        buttonLoose.layer.borderWidth = 0
        buttonGain.layer.borderWidth = 1
        
        goal = "Loose weight"
    }
    
    @objc func btnG(){
        buttonLoose.backgroundColor = .white
        buttonGain.backgroundColor = UIColor(red: 255/255, green: 114/255, blue: 94/255, alpha: 1.0)
        
        buttonLoose.setTitleColor(.black, for: .normal)
        buttonGain.setTitleColor(.white, for: .normal)
        
        buttonLoose.layer.borderWidth = 1
        buttonGain.layer.borderWidth = 0
        
        goal = "Gain muscle"
    }
    
//    @objc func getSummary(){
//        let vc = summaryView()
//        navigationController?.pushViewController(vc, animated: true)
//    }
    
}

