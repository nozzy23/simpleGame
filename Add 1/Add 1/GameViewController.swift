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
    var score = 0
    
    func updateScoreLabel(){
        //when Scorelabel is nil the code stops and continues. the optional is unwrapped only when its not nil
        //string(...) is init from the
        scoreLabel?.text = String(score)
    }
    
    func updateNUmberLabel(){
        numberLabel?.text = String.randomNumber(length: 4)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

