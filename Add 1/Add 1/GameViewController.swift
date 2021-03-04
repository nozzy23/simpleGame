//
//  ViewController.swift
//  Add 1
//
//  Created by oscar nunez on 3/2/21.
//

import UIKit



class GameViewController: UIViewController {
    //@IBOutlet means the property is a outlet
    //Weak var makes it weak? lol
    // question mark makes it optional so it can be nil (?)
    @IBOutlet weak var scoreLabel:UILabel?
    @IBOutlet weak var timeLabel:UILabel?
    @IBOutlet weak var numberLabel:UILabel?
    @IBOutlet weak var inputField:UITextField?
    var timer:Timer?
    var seconds = 60
    
    var score = 0
    
    // this function is defined by UIViewController and override makes it so we can customize it
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateScoreLabel()
        updateNUmberLabel()
        updateTimeLabel()
    }
    
    func updateScoreLabel() {
        //when Scorelabel is nil the code stops and continues. the optional is unwrapped only when its not nil
        //string(...) is init from the
        scoreLabel?.text = String(score)
    }
    
    func updateNUmberLabel() {
        numberLabel?.text = String.randomNumber(length: 4)
    }
    
    @IBAction func inputFieldDidChange(){
        guard let numberText = numberLabel?.text, let inputText = inputField?.text else {
            return
        }
        guard inputText.count == 4 else {
            return 
        }
        
        var isCorrect = true
        for n in 0..<4
        {
            var input = inputText.integer(at: n)
            let number = numberText.integer(at: n)
            if input == 0 {
                input = 10
            
                if input != number + 1 {
                    isCorrect = false
                    break
                }
            }
        }
        if isCorrect {
            score += 1
        } else {
            score -= 1
        }
        updateNUmberLabel()
        updateScoreLabel()
        inputField?.text = ""
        
        if timer == nil {
            timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
                
                if self.seconds == 0 {
                    self.finishGame()
                } else if self.seconds <= 60{
                    self.seconds -= 1
                    self.updateTimeLabel()
                }
            }
        }
    }
    
    func updateTimeLabel() {
        let min = (seconds / 60) % 60
        let sec = seconds % 60
        
        timeLabel?.text = String(format: "%02d", min) + ":" + String(format:"%02d", sec)
    }
    
    func finishGame(){
        timer?.invalidate()
        timer = nil
        let alert = UIAlertController(title: "Times up!", message: "Nice going! Here is your total score \(score) points. Way to go", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok, let's play again", style: .default, handler: nil))
        score = 0
        seconds = 60
        updateTimeLabel()
        updateScoreLabel()
        updateNUmberLabel()
    }
}

