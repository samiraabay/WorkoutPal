//
//  NavBar.swift
//  WorkoutPal
//
//  Created by Samira Abayasekara on 2023-05-17.
//

import Foundation
import UIKit

class NavBar: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Configure the navigation bar
        navigationController?.navigationBar.barTintColor = UIColor(red: 0.2, green: 0.6, blue: 0.8, alpha: 1.0)
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.isTranslucent = false
        
        // Set the title
        title = "WorkoutPal"
        
        // Add bar button items
        let leftBarButtonItem = UIBarButtonItem(title: "Home", style: .plain, target: self, action: #selector(homeButtonTapped))
        
        let centerLeftBarButtonItem = UIBarButtonItem(title: "My Plan", style: .plain, target: self, action: #selector(historyButtonTapped))
        
        let centerRightBarButtonItem = UIBarButtonItem(title: "Schedule", style: .plain, target: self, action: #selector(scheduleButtonTapped))
        
        let rightBarButtonItem = UIBarButtonItem(title: "Settings", style: .plain, target: self, action: #selector(settingsButtonTapped))
        
        navigationItem.leftBarButtonItems = [leftBarButtonItem,centerLeftBarButtonItem, centerRightBarButtonItem,rightBarButtonItem]
    }
    
    // Action when the buttons are tapped
    
    @objc func homeButtonTapped() {
        let vc = homeView()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func historyButtonTapped() {
        let vc = historyView()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func scheduleButtonTapped() {
        let vc = schedulePicker()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func settingsButtonTapped() {
        let vc = aboutUserView()
        navigationController?.pushViewController(vc, animated: true)
    }
}
