//
//  TabBar.swift
//  WorkoutPal
//
//  Created by Samira Abayasekara on 2023-05-21.
//

import Foundation
import UIKit

class TabBar: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Configure the tab bar
        tabBar.barTintColor = UIColor(red: 0.2, green: 0.6, blue: 0.8, alpha: 1.0)
        tabBar.tintColor = .white
        tabBar.isTranslucent = false
        
        // Set up view controllers for each tab
        let homeViewController = HomeViewController()
        homeViewController.tabBarItem = UITabBarItem(title: "Home", image: nil, tag: 0)
        
        let historyViewController = HistoryViewController()
        historyViewController.tabBarItem = UITabBarItem(title: "My Plan", image: nil, tag: 1)
        
        let scheduleViewController = ScheduleViewController()
        scheduleViewController.tabBarItem = UITabBarItem(title: "Schedule", image: nil, tag: 2)
        
        let settingsViewController = SettingsViewController()
        settingsViewController.tabBarItem = UITabBarItem(title: "Settings", image: nil, tag: 3)
        
        viewControllers = [homeViewController, historyViewController, scheduleViewController, settingsViewController]
    }
}

class HomeViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Home"
        let vc = homeView()
        navigationController?.pushViewController(vc, animated: true)
    }
}

class HistoryViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "My Plan"
        let vc = historyView()
        navigationController?.pushViewController(vc, animated: true)
    }
}

class ScheduleViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Schedule"
        let vc = schedulePicker()
        navigationController?.pushViewController(vc, animated: true)
    }
}

class SettingsViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Settings"
        let vc = aboutUser()
        navigationController?.pushViewController(vc, animated: true)
    }
}

