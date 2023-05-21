//
//  homeView.swift
//  WorkoutPal
//
//  Created by Samira Abayasekara on 2023-05-19.
//

import Foundation
import UIKit

public var selectedExercise : String = ""

class homeView: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let labelOne : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 30, weight: .semibold)
        label.textColor = UIColor(red: 140/255, green: 140/255, blue: 140/255, alpha: 1.0)
        label.text = "Welcome, \(uname) !"
        label.textAlignment = .center
        return label
    }()
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return tableView
    }()
    
    let exercises = ["Push-ups", "Squats", "Plank", "Lunges", "Sit-ups"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Configure the view
        view.backgroundColor = .white
        
        // Set up the table view
        tableView.delegate = self
        tableView.dataSource = self
        
        // Add the table view to the view
        view.addSubview(labelOne)
        view.addSubview(tableView)
        
        // Set up constraints
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            
            labelOne.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            labelOne.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            labelOne.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            labelOne.heightAnchor.constraint(equalToConstant: 40),
            
            tableView.topAnchor.constraint(equalTo: labelOne.bottomAnchor, constant: 20),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    // MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return exercises.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let exercise = exercises[indexPath.row]
        cell.textLabel?.text = exercise
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Handle row selection
        let selectedExercise = exercises[indexPath.row]
        
        if (selectedExercise == "Push-ups"){
            let vc = exerciseView()
            navigationController?.pushViewController(vc, animated: true)
        }
        
        print("Selected exercise: \(selectedExercise)")
    }
}
