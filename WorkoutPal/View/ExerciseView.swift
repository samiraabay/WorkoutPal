//
//  ExerciseView.swift
//  WorkoutPal
//
//  Created by Samira Abayasekara on 2023-05-20.
//

import Foundation
import UIKit
import AVKit
import AVFoundation

class exerciseView: UIViewController {
    let videoPlayer = AVPlayer()
    let playerViewController = AVPlayerViewController()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.textAlignment = .center
        label.text = selectedExerciseName
        return label
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.text = selectedExerciseDescription
        return label
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
        view.backgroundColor = .white
        
        // Set up the video player
        guard let videoURL = Bundle.main.url(forResource: selectedExerciseName, withExtension: "mp4") else {
            fatalError("Video file not found")
        }
        let playerItem = AVPlayerItem(url: videoURL)
        videoPlayer.replaceCurrentItem(with: playerItem)
        playerViewController.player = videoPlayer
        playerViewController.showsPlaybackControls = true
        
        // Set up the video player's view
        let videoPlayerView = playerViewController.view
        videoPlayerView?.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height * 0.6)
        videoPlayerView?.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        // Set up the title label
        titleLabel.frame = CGRect(x: 16, y: videoPlayerView!.frame.maxY + 16, width: view.bounds.width - 32, height: 30)
        
        // Set up the description label
        descriptionLabel.frame = CGRect(x: 16, y: titleLabel.frame.maxY + 8, width: view.bounds.width - 32, height: 100)
        
        // Add the video player's view, title label, and description label to the view
        view.addSubview(videoPlayerView!)
        view.addSubview(titleLabel)
        view.addSubview(descriptionLabel)
        view.addSubview(buttonCont)
        
        // Start playing the video
        videoPlayer.play()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the video when the view disappears
        videoPlayer.pause()
    }
}
