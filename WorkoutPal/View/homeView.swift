//
//  homeView.swift
//  WorkoutPal
//
//  Created by Samira Abayasekara on 2023-05-19.
//

import Foundation
import UIKit

public var selectedExerciseName : String = ""
public var selectedExerciseDescription : String = ""

class homeView: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let titleLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.text = "Welcome, \(uname)"
        label.textAlignment = .left
        return label
    }()
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(ExerciseTableViewCell.self, forCellReuseIdentifier: ExerciseTableViewCell.reuseIdentifier)
        return tableView
    }()
    
    let exercises: [(icon: String, title: String, description: String)] = [
        ("cobra_icon", "Cobra Stretch", "An exercise that engaages muscles from the chest and back to the hamstrings"),
        ("pushup_icon", "Push Ups", "An exercise that engages muscles in the arms and chest"),
        ("exercise_icon3", "Exercise 3", "Description 3"),
        ("exercise_icon4", "Exercise 4", "Description 4"),
        ("exercise_icon5", "Exercise 5", "Description 5")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        // Set up the table view
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .none
        
        // Register custom cell class
        tableView.register(ExerciseTableViewCell.self, forCellReuseIdentifier: ExerciseTableViewCell.reuseIdentifier)
        
        // Add the table view to the view
        view.addSubview(titleLabel)
        view.addSubview(tableView)
        
        // Set up constraints
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 40),
            titleLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: 40),
            
            tableView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 15),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    // MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return exercises.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ExerciseTableViewCell.reuseIdentifier, for: indexPath) as! ExerciseTableViewCell
        let exercise = exercises[indexPath.row]
        cell.configure(with: exercise)
        return cell
    }
    
    // MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let exercise = exercises[indexPath.row]
        selectedExerciseName = exercise.title
        selectedExerciseDescription = exercise.description
        let vc = exerciseView()
        navigationController?.pushViewController(vc, animated: true)
    }

}

class ExerciseTableViewCell: UITableViewCell {
    static let reuseIdentifier = "ExerciseTableViewCell"
    
    let iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .gray
        label.numberOfLines = 0
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        // Configure the cell
        selectionStyle = .none
        
        // Set up the icon image view
        iconImageView.frame = CGRect(x: 16, y: 10, width: 60, height: 60)
        contentView.addSubview(iconImageView)
        
        // Set up the title label
        titleLabel.frame = CGRect(x: iconImageView.frame.maxX + 16, y: 10, width: contentView.bounds.width - 92, height: 20)
        contentView.addSubview(titleLabel)
        
        // Set up the description label
        descriptionLabel.frame = CGRect(x: iconImageView.frame.maxX + 16, y: titleLabel.frame.maxY + 4, width: contentView.bounds.width - 92, height: 40)
        contentView.addSubview(descriptionLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with exercise: (icon: String, title: String, description: String)) {
        iconImageView.image = UIImage(named: exercise.icon)
        titleLabel.text = exercise.title
        descriptionLabel.text = exercise.description
    }
}

