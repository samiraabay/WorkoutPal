//
//  MyExercisesView.swift
//  WorkoutPal
//
//  Created by Samira Abayasekara on 2023-05-21.
//

import Foundation
import UIKit

class historyView: UIViewController, UITableViewDelegate, UITableViewDataSource {
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
        view.addSubview(tableView)
        
        // Set up constraints
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
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
        print("Selected exercise: \(selectedExercise)")
        
        // Navigate to exercise details page or perform other actions
    }
}
