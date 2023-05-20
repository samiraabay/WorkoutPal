//
//  Login.swift
//  WorkoutPal
//
//  Created by Samira Abayasekara on 2023-05-15.
//

import Foundation
import UIKit

class login: UIViewController {

    //UI Comps
    
    let labelOne : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 36, weight: .thin)
        label.text = "Welcome back"
        label.textAlignment = .center
        return label
    }()
    
    let labelTwo : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 14, weight: .semibold)
        label.textColor = UIColor(red: 191/255, green: 195/255, blue: 195/255, alpha: 1.0)
        label.text = "Let’s build again!"
        label.textAlignment = .center
        return label
    }()
    
    let imageSI: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "login"))
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let buttonGoogle : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "google"), for: .normal)
        button.setTitle("   Continue with Google", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .semibold)
        button.backgroundColor = UIColor(red: 69/255, green: 90/255, blue: 100/255, alpha: 1.0)
        button.layer.cornerRadius = 10
        return button
    }()
    
    let buttonApple : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "apple"), for: .normal)
        button.setTitle("   Continue with Apple", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .semibold)
        button.backgroundColor = UIColor(red: 69/255, green: 90/255, blue: 100/255, alpha: 1.0)
        button.layer.cornerRadius = 10
        return button
    }()
    
    let labelFour : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 14, weight: .semibold)
        label.textColor = UIColor(red: 191/255, green: 195/255, blue: 195/255, alpha: 1.0)
        label.text = "Don't have an account?"
        label.textAlignment = .center
        return label
    }()
    
    let buttonSU : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Sign up", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 14, weight: .bold)
        button.backgroundColor = .white
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    let hStack : UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.spacing = 5
        return stack
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        
    }

    func setupUI(){
        view.backgroundColor = .white
        view.addSubview(labelOne)
        view.addSubview(labelTwo)
        view.addSubview(imageSI)
        view.addSubview(buttonGoogle)
        view.addSubview(buttonApple)
        
        hStack.addArrangedSubview(labelFour)
        hStack.addArrangedSubview(buttonSU)
        
        view.addSubview(hStack)
        
        //button actions
        
        buttonSU.addTarget(self, action: #selector(getRegister), for: .touchUpInside)
        buttonGoogle.addTarget(self, action: #selector(getGender), for: .touchUpInside)
        buttonApple.addTarget(self, action: #selector(getGender), for: .touchUpInside)
       
        
        //constraints
        NSLayoutConstraint.activate([
            labelOne.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            labelOne.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            labelOne.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            labelOne.heightAnchor.constraint(equalToConstant: 40),

            labelTwo.topAnchor.constraint(equalTo: labelOne.bottomAnchor),
            labelTwo.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            labelTwo.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            //labelTwo.heightAnchor.constraint(equalToConstant: 40),
            
            imageSI.topAnchor.constraint(equalTo: labelTwo.bottomAnchor),
            imageSI.heightAnchor.constraint(equalToConstant: 381),
            imageSI.widthAnchor.constraint(equalToConstant: 381),
            imageSI.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            buttonGoogle.topAnchor.constraint(equalTo: imageSI.bottomAnchor, constant: 20),
            buttonGoogle.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 70),
            buttonGoogle.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -70),
            buttonGoogle.heightAnchor.constraint(equalToConstant: 50),
            buttonGoogle.widthAnchor.constraint(equalToConstant: 227),
            
            buttonApple.topAnchor.constraint(equalTo: buttonGoogle.bottomAnchor, constant: 10),
            buttonApple.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 70),
            buttonApple.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -70),
            buttonApple.heightAnchor.constraint(equalToConstant: 50),
            buttonApple.widthAnchor.constraint(equalToConstant: 227),
            
            hStack.topAnchor.constraint(equalTo: buttonApple.bottomAnchor),
            hStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }
    
    //button actions
    @objc func getRegister(){
        let vc = register()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func getGender(){
        let vc = genderView()
        navigationController?.pushViewController(vc, animated: true)
    }
}
