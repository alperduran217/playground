//
//  OperationViewController.swift
//  Playground
//
//  Created by Mehmet Alper Duran on 23/04/16.
//  Copyright © 2016 Alper Duran. All rights reserved.
//

import UIKit

class OperationViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // Labels are invisible until the user taps the start button
        div.alpha = 0
        add.alpha = 0
        minus.alpha = 0
        multi.alpha = 0
        
        if languageChoice == 1 {
            tutorial.setImage(UIImage(named: "start-en.png"), forState: UIControlState.Normal)

        }
        
        if isTapped == true {
            tutorial.alpha = 0
        }
        
       

 
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    var points:Int = 0 // where earned pointes are stored
    
    var operation = 0 // holds the value of the operations
    
    var button1Value = 0 // Hold the one of the answers
    
    var button2Value = 0 // Hold the onf of the answers
    
    var randomChoice:Int = 0 // Holds the answers position
    
    var randomNumber:Int = -1 // changes the value of the correct answer
    
    var labelRandomNumber1:Int = -1 // one of the answer
    
    var labelRandomNumber2:Int = -1 // one of the answer
    
    var result:Int = 0 // result
    
    var fakeResult:Int = 0 // fakeResult
    
    var timer = NSTimer() // this is NS object and it's runs the reversCounter function
    
    var timer2 = NSTimer() // this is NS object and it's runs the timetoMoveOn function
    
    var timeValue:Int = 50

    var tapped:Int = 0
    
    var isTapped = false


    @IBAction func tutorialAction(sender: AnyObject) {
        tapped += 1
        start.alpha = 0
        
        if languageChoice == 0 {
            
            if tapped == 0 {
                tutorial.setImage(UIImage(named: "start-tr.png"), forState: UIControlState.Normal)
                
            }
            
            if tapped == 1 {
                tutorial.setImage(UIImage(named: "operationgame-time-tr.png"), forState: UIControlState.Normal)
                
            }
            
            if tapped == 2 {
                tutorial.setImage(UIImage(named: "operationgame-score-tr.png"), forState: UIControlState.Normal)
                
            }
            
            if tapped == 3 {
                tutorial.setImage(UIImage(named: "operationgame-answer-tr.png"), forState: UIControlState.Normal)
                
                
             
            }
            
            if tapped == 4 {
                tutorial.setImage(UIImage(named: "attentiongame-pick-tr.png"), forState: UIControlState.Normal)
                
                
                tutorial.alpha = 0
                start.alpha = 1
                
                isTapped = true
           
                
            }
            
            
        }
        
        
        if languageChoice == 1 {
            
            if tapped == 0 {
                tutorial.setImage(UIImage(named: "start-en.png"), forState: UIControlState.Normal)
                
                
            }
            
            if tapped == 1 {
                tutorial.setImage(UIImage(named: "operationgame-time-en.png"), forState: UIControlState.Normal)
                
            }
            
            if tapped == 2 {
                tutorial.setImage(UIImage(named: "operationgame-score-en.png"), forState: UIControlState.Normal)
                
            }
            
            if tapped == 3 {
                tutorial.setImage(UIImage(named: "operationgame-answer-en.png"), forState: UIControlState.Normal)
                
            
                
            }
            
            if tapped == 4 {
                tutorial.setImage(UIImage(named: "attentiongame-pick-en.png"), forState: UIControlState.Normal)
                
                
                tutorial.alpha = 0
                start.alpha = 1
                
            }
            
            
            
        }
        

    }
    @IBOutlet weak var tutorial: UIButton!
    @IBOutlet weak var answerLabel: UILabel!
    @IBOutlet var operationView: UIView!
    @IBOutlet weak var multi: UILabel!
    @IBOutlet weak var div: UILabel!
    @IBOutlet weak var minus: UILabel!
    @IBOutlet weak var add: UILabel!
    @IBOutlet weak var start: UIButton!
    @IBAction func restart(sender: AnyObject) {
        
        div.alpha = 0
        add.alpha = 0
        minus.alpha = 0
        multi.alpha = 0
        start.alpha = 1
        timer.invalidate()
        timer2.invalidate()
        timeValue = 50
        timeLabel.text = "50"
        
    }
    
    @IBAction func startAction(sender: AnyObject) {
        start.alpha = 0
        doOperation()
        
        // timer lets decrease counter
        
        timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: #selector(OperationViewController.reverseCounter), userInfo: nil, repeats: true)
        
        // segue action after the timer goes on 51
        
        timer2 = NSTimer.scheduledTimerWithTimeInterval(51.0, target: self, selector: #selector(OperationViewController.timeToMoveOn), userInfo: nil, repeats: false)
        
        
        

    }
    @IBAction func button2Act(sender: AnyObject) {
       buttonReverse()
        doOperation()
        button2Answer()
        
    }
    @IBAction func button1act(sender: AnyObject) {
        buttonReverse()
        doOperation()
        button1Answer()
      
    }
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var pointsLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var bigLabel: UILabel!

    @IBOutlet weak var smallLabel: UILabel!
    
    @IBOutlet weak var numBox: UITextField!
    
// disables the buttons
    func disableButton() {
            //division
        if operation == 1 {
            
            div.alpha = 1
            add.alpha = 0
            minus.alpha = 0
            multi.alpha = 0
            
        }
            //Addition
        if operation == 2 {
            div.alpha = 0
            add.alpha = 1
            minus.alpha = 0
            multi.alpha = 0
        }
        
            //Minus
        if operation == 3 {
            div.alpha = 0
            add.alpha = 0
            minus.alpha = 1
            multi.alpha = 0
        }
        
            //Multi
        if operation == 4 {
            div.alpha = 0
            add.alpha = 0
            minus.alpha = 0
            multi.alpha = 1
        }
        
    }
    
    // function that decides which operation should go
    
    func buttonSelect() {
        
        
        randomNumber = Int(arc4random_uniform(5))
        
        operation = randomNumber
        
        // prevents the operation value get zero
        
        if operation == 0 {
            
            randomNumber = Int(arc4random_uniform(5))
            
            operation = randomNumber

        }
        
        disableButton()
        randomLabelNumbers()
        
        
    }
    
    // Function that all operations happens
    
    func doOperation() {
        
        buttonSelect()
        
        if operation == 1 {
            
            result = labelRandomNumber1 / labelRandomNumber2
            fakeResult = result + randomNumber
            
            
                
                button1.setTitle("\(result)", forState: .Normal)
                button2.setTitle("\(fakeResult)", forState: .Normal)
                
                button1Value = result
                button2Value = fakeResult
                


        }
        
        if operation == 2 {
            
            result = labelRandomNumber1 + labelRandomNumber2
            fakeResult = result + randomNumber
            
         
                
                button1.setTitle("\(result)", forState: .Normal)
                button2.setTitle("\(fakeResult)", forState: .Normal)
            
                button1Value = result
                button2Value = fakeResult
                
   

        }
        
        if operation == 3 {
            result = labelRandomNumber1 - labelRandomNumber2
            fakeResult = result + randomNumber
            
                
                button1.setTitle("\(result)", forState: .Normal)
                button2.setTitle("\(fakeResult)", forState: .Normal)
                
                button1Value = result
                button2Value = fakeResult
            
        }
        
        if operation == 4 {
            result = labelRandomNumber1 * labelRandomNumber2
            fakeResult = result + randomNumber
            
            
                
                button1.setTitle("\(result)", forState: .Normal)
                button2.setTitle("\(fakeResult)", forState: .Normal)
                
                button1Value = result
                button2Value = fakeResult
          

        }
    
    }
    
    
    // Function that arranges the questions everytime.
    func randomLabelNumbers() {
        
        labelRandomNumber1 = Int(arc4random_uniform(10))
        labelRandomNumber2 = Int(arc4random_uniform(10))
        
        while labelRandomNumber2 > labelRandomNumber1 || labelRandomNumber2 == 0{
            labelRandomNumber1 = Int(arc4random_uniform(10))
            labelRandomNumber2 = Int(arc4random_uniform(10))
        }
        

        
        bigLabel.text = String(labelRandomNumber1)
        smallLabel.text = String(labelRandomNumber2)
        
    }
    
    // what happens when buttons in actions
    
    func button1Answer() {
        
        if button1Value == result {
            self.view.backgroundColor = UIColor.greenColor()
            
            if languageChoice == 1 {
                answerLabel.text = "Correct"
            }
            
            if languageChoice == 0 {
                
                answerLabel.text = "Doğru"
                
            }
            
            points = points + 10

            pointsLabel.text = String(points)

            delay(0.4) {
                self.view.backgroundColor = UIColor.whiteColor()

            }
        }
        
        if button1Value == fakeResult {
            self.view.backgroundColor = UIColor.redColor()
            
            if languageChoice == 1 {
                answerLabel.text = "Wrong"
            }
            
            if languageChoice == 0 {
                
                answerLabel.text = "Yanlış"
                
            }
            
            delay(0.4) {
                self.view.backgroundColor = UIColor.whiteColor()
                
            }
        }
        
        }
    func button2Answer() {
        
        if button2Value == result {
            self.view.backgroundColor = UIColor.greenColor()
            
            if languageChoice == 1 {
                answerLabel.text = "Correct"
            }
            
            if languageChoice == 0 {
                
                answerLabel.text = "Doğru"
                
            }
            
            points = points + 10
            
            pointsLabel.text = String(points)
            
            delay(0.4) {
                self.view.backgroundColor = UIColor.whiteColor()
                
            }
        }
        
        if button2Value == fakeResult {
            self.view.backgroundColor = UIColor.redColor()
            
            if languageChoice == 1 {
                answerLabel.text = "Wrong"
            }
            
            if languageChoice == 0 {
                
                answerLabel.text = "Yanlış"
                
            }
            
            delay(0.4) {
                self.view.backgroundColor = UIColor.whiteColor()
                
            }
        }
        
    }
    

    // reverse for timer
    
    func reverseCounter() {
        
        timeValue = timeValue - 1
        
        timeLabel.text = String(timeValue)
        
    }
    
    // button for change
    
    func buttonReverse() {
        
        randomChoice = Int(arc4random_uniform(2))

        if randomChoice == 0 {
            button1.frame = CGRectMake(142, 100, 115, 359)
            button2.frame = CGRectMake(142, 100, 343, 359)
            

        }
        
        if randomChoice == 1 {
            button2.frame = CGRectMake(142, 100, 115, 359)
            button1.frame = CGRectMake(142, 100, 343, 359)
            
        }
        

    }
    
    
    // segue function
    
    func timeToMoveOn() {
        
        records.append(String(points))
        
        NSUserDefaults.standardUserDefaults().setObject(records, forKey: "records")

        
        self.performSegueWithIdentifier("goToResults", sender: self)
    }
    
    // delay function
    
    func delay(delay: Double, closure: ()->()) {
        dispatch_after(
            dispatch_time(
                DISPATCH_TIME_NOW,
                Int64(delay * Double(NSEC_PER_SEC))
            ),
            dispatch_get_main_queue(),
            closure
        )
    }

    

}
