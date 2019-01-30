//
//  ViewController.swift
//  TapLights
//
//  Created by Gustavo Colaco on 29/01/19.
//  Copyright © 2019 Gustavo Colaco. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var trafficLightImg: UIImageView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var startStopBtn: UIButton!
    
    var startTimer = Timer()
    var scoreTimer = Timer()
    
    var timerInt = 0
    var scoreInt = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scoreInt = 0
        
    }
    
    @IBAction func startGameAction(_ sender: Any) {
        
        if scoreInt == 0 {
            
            timerInt = 3
            
            trafficLightImg.image =  UIImage(named: "trafficLight")
            
            startTimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
            
            startStopBtn.isEnabled = false
            startStopBtn.setTitle("", for: UIControl.State.normal)
            
            label.text = "\(scoreInt)"
            
        } else {
            
            scoreTimer.invalidate()
            
            scoreInt = 0
            startStopBtn.setTitle("Restart", for: UIControl.State.normal)
            
        }
        
    }
    
    @objc func updateTimer() {
        timerInt -= 1
        
        if timerInt == 2 {
            trafficLightImg.image = UIImage(named: "trafficLight3")
        }else if timerInt == 1 {
            trafficLightImg.image = UIImage(named: "trafficLight2")
        }else if timerInt == 0 {
            trafficLightImg.image = UIImage(named: "trafficLight1")
            
            startTimer.invalidate()
            
            scoreTimer = Timer.scheduledTimer(timeInterval: 0.0001, target: self, selector: #selector(updateScoreTimer), userInfo: nil, repeats: true)
            
            startStopBtn.isEnabled = true
            startStopBtn.setTitle("Stop", for: UIControl.State.normal)
            
        }
    }
    
    @objc func updateScoreTimer() {
        scoreInt += 1
        label.text = "\(scoreInt)"
        
    }


}

