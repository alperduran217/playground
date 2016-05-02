//
//  AttentionViewController.swift
//  Playground
//
//  Created by Mehmet Alper Duran on 24/04/16.
//  Copyright © 2016 Alper Duran. All rights reserved.
//

import UIKit

class AttentionViewController: UIViewController {
    
    
    //This function executes immediatly when the app start working.
    override func viewDidLoad() {
        super.viewDidLoad()

        // This chunk of code disappears all of the buttons except the Start button
        answer1.alpha = 0
        answer2.alpha = 0
        answer3.alpha = 0
        answer4.alpha = 0
        questionPic.alpha = 0
        
        
        if languageChoice == 1 {
            tutorial.setImage(UIImage(named: "start1-en.png"), forState: UIControlState.Normal)

        }

  
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
// VARIABLES
    
    var timer = NSTimer()   //This is a time variable. This variable created for Counter.
    var timer2 = NSTimer()  //This is an another time variable. This variable created for automatic segues.
    
    
    var timeValue = 50
    
    var points = 0
    
    var foundValue1 = 0
    var foundValue2 = 0
    var foundValue3 = 0
    var foundValue4 = 0
    
    var randomButton:Int = Int(arc4random_uniform(3))

    
    var randomChoice:Int = 0
    
    var trueAnswer:Int = -1
    
    var picsArray:[String] = ["blue.png","green.png","orange.png","red.png","yellow.png","apple.png","apricot.png","avocado.png","banana.png","beans.png","blackberry.png","carrot.png","cherry.png","corn.png","cucumber.png","grapes.png","green apple.png","lemon.png","orang.png","peach.png","pepper.png","pomegranate.png","strawberry.png","tomatos.png","watermelon.png","parallelogram.png","star.png","rectangle.png","heart.png","square.png","triangle.png","oval.png","circle.png","trapezoid.png","deltoid.png","pentagon.png","hexagon.png","monkey.png","lion.png","snake.png","zebra.png","giraffe.png","elephant.png","crocodile.png","cat.png"]
    

    //Variables on View
    @IBOutlet weak var questionPic: UIImageView!
    @IBOutlet weak var answer1: UIButton!
    @IBOutlet weak var answer2: UIButton!
    @IBOutlet weak var answer3: UIButton!
    @IBOutlet weak var answer4: UIButton!
    @IBAction func answerAction1(sender: AnyObject) {
        
        if foundValue1 == 1 {

            foundValue1 = 0

            self.view.backgroundColor = UIColor.greenColor()
            
            if languageChoice == 0 {
            
            answerLabel.text = "Doğru"
            
            }
            
            if languageChoice == 1 {
                
                answerLabel.text = "Correct"
                
            }
            points = points + 10
            
            pointsLabel.text = String(points)
            
            delay(0.4) {
                self.view.backgroundColor = UIColor.whiteColor()
                
            }

        }
        
        reappear()
        
    }
    @IBAction func answerAction2(sender: AnyObject) {
      
        
        if foundValue2 == 1 {
            
            foundValue2 = 0
            
            
            if languageChoice == 0 {
                
                answerLabel.text = "Doğru"
                
            }
            
            if languageChoice == 1 {
                
                answerLabel.text = "Correct"
                
            }

            
            self.view.backgroundColor = UIColor.greenColor()
            
            points = points + 10
            
            pointsLabel.text = String(points)
            
            delay(0.4) {
                self.view.backgroundColor = UIColor.whiteColor()
                
            }

        }
        
        
        
        reappear()
    }
    @IBAction func answerAction3(sender: AnyObject) {
    
        
        if foundValue3 == 1 {
            foundValue3 = 0
            
            
            if languageChoice == 0 {
                
                answerLabel.text = "Doğru"
                
            }
            
            if languageChoice == 1 {
                
                answerLabel.text = "Correct"
                
            }

            
            self.view.backgroundColor = UIColor.greenColor()
            
            points = points + 10
            
            pointsLabel.text = String(points)
            
            delay(0.4) {
                self.view.backgroundColor = UIColor.whiteColor()
                
            }

        }
        
        reappear()
    }
    @IBAction func answerAction4(sender: AnyObject) {
   
        
        if foundValue4 == 1 {
            foundValue4 = 0

            
            if languageChoice == 0 {
                
                answerLabel.text = "Doğru"
                
            }
            
            if languageChoice == 1 {
                
                answerLabel.text = "Correct"
                
            }

            
            self.view.backgroundColor = UIColor.greenColor()
            
            points = points + 10
            
            pointsLabel.text = String(points)
            
            delay(0.4) {
                self.view.backgroundColor = UIColor.whiteColor()
                
            }

        }
        
        reappear()
        
    }
    @IBAction func startAction(sender: AnyObject) {
        
        start.alpha = 0
        // timer lets decrease counter
        
        timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: #selector(OperationViewController.reverseCounter), userInfo: nil, repeats: true)
        
        // segue action after the timer goes on 51
        
        timer2 = NSTimer.scheduledTimerWithTimeInterval(51.0, target: self, selector: #selector(AttentionViewController.timeToMoveOn), userInfo: nil, repeats: false)


       reappear()
    }
    
    var tapped:Int = 0

    
    @IBAction func tutorialAction(sender: AnyObject) {
        
        tapped += 1
        start.alpha = 0
        
        if languageChoice == 0 {
            
            if tapped == 0 {
                tutorial.setImage(UIImage(named: "start1-tr.png"), forState: UIControlState.Normal)
                
            }
            
            if tapped == 1 {
                tutorial.setImage(UIImage(named: "attentiongame-time-tr.png"), forState: UIControlState.Normal)
                
            }
            
            if tapped == 2 {
                tutorial.setImage(UIImage(named: "attentiongame-pic-tr.png"), forState: UIControlState.Normal)
                
            }
            
            if tapped == 3 {
                tutorial.setImage(UIImage(named: "attentiongame-pick-tr.png"), forState: UIControlState.Normal)
                
                
                tutorial.alpha = 0
                start.alpha = 1
            }
            
            
        }
        
        if languageChoice == 1 {
            
            if tapped == 0 {
                tutorial.setImage(UIImage(named: "start1-en.png"), forState: UIControlState.Normal)
                
            }
            
            if tapped == 1 {
                tutorial.setImage(UIImage(named: "attentiongame-time-en.png"), forState: UIControlState.Normal)
                
            }
            
            if tapped == 2 {
                tutorial.setImage(UIImage(named: "attentiongame-pic-en.png"), forState: UIControlState.Normal)
                
            }
            
            if tapped == 3 {
                tutorial.setImage(UIImage(named: "attentiongame-pick-en.png"), forState: UIControlState.Normal)
                
                
                tutorial.alpha = 0
                start.alpha = 1
            }
            
            
        }
    }
    @IBOutlet weak var tutorial: UIButton!
    @IBOutlet weak var pointsLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var start: UIButton!
    @IBOutlet weak var answerLabel: UILabel!
    @IBAction func restart(sender: AnyObject) {
        answer1.alpha = 0
        answer2.alpha = 0
        answer3.alpha = 0
        answer4.alpha = 0
        questionPic.alpha = 0
        timer.invalidate()
        timer2.invalidate()
        timeValue = 50
        timeLabel.text = "50"
        start.alpha = 1
    }
    
    
    
// This function makes every image appear

    func setupImage() {
        
        let picsArrayValue = UInt32(picsArray.count)
        
        trueAnswer = Int(arc4random_uniform(picsArrayValue))
        
        questionPic.image = UIImage(named: picsArray[Int(trueAnswer)])
       
    }
    
// This function randomize the correct answer each time
    
    func correctAnswer() {
        
        if randomButton == 0 {
            
            
            
            answer1.setImage(UIImage(named: picsArray[Int(trueAnswer)]), forState: UIControlState.Normal)
            
            foundValue1 = 1
            
            let picsArrayValue = UInt32(picsArray.count)
            
            randomChoice = Int(arc4random_uniform(picsArrayValue))
            
            answer2.setImage(UIImage(named: picsArray[Int(randomChoice)]), forState: UIControlState.Normal)
            
            randomChoice = Int(arc4random_uniform(picsArrayValue))
            
            answer3.setImage(UIImage(named: picsArray[Int(randomChoice)]), forState: UIControlState.Normal)
            
            randomChoice = Int(arc4random_uniform(picsArrayValue))
            
            answer4.setImage(UIImage(named: picsArray[Int(randomChoice)]), forState: UIControlState.Normal)
            
            randomChoice = Int(arc4random_uniform(picsArrayValue))
            
            randomButton = Int(arc4random_uniform(3))

        }
        
        
        if randomButton == 1 {
            answer2.setImage(UIImage(named: picsArray[Int(trueAnswer)]), forState: UIControlState.Normal)

            foundValue2 = 1
            
            let picsArrayValue = UInt32(picsArray.count)
            
            randomChoice = Int(arc4random_uniform(picsArrayValue))
            
            answer1.setImage(UIImage(named: picsArray[Int(randomChoice)]), forState: UIControlState.Normal)
            
            randomChoice = Int(arc4random_uniform(picsArrayValue))
            
            answer3.setImage(UIImage(named: picsArray[Int(randomChoice)]), forState: UIControlState.Normal)
            
            randomChoice = Int(arc4random_uniform(picsArrayValue))
            
            answer4.setImage(UIImage(named: picsArray[Int(randomChoice)]), forState: UIControlState.Normal)
            
            randomChoice = Int(arc4random_uniform(picsArrayValue))

            randomButton = Int(arc4random_uniform(3))

        }
        
        
        if randomButton == 2 {
            
            answer3.setImage(UIImage(named: picsArray[Int(trueAnswer)]), forState: UIControlState.Normal)
            
            foundValue3 = 1
            
            let picsArrayValue = UInt32(picsArray.count)
            
            randomChoice = Int(arc4random_uniform(picsArrayValue))
            
            answer2.setImage(UIImage(named: picsArray[Int(randomChoice)]), forState: UIControlState.Normal)
            
            randomChoice = Int(arc4random_uniform(picsArrayValue))
            
            answer1.setImage(UIImage(named: picsArray[Int(randomChoice)]), forState: UIControlState.Normal)
            
            randomChoice = Int(arc4random_uniform(picsArrayValue))
            
            answer4.setImage(UIImage(named: picsArray[Int(randomChoice)]), forState: UIControlState.Normal)
            
            randomChoice = Int(arc4random_uniform(picsArrayValue))
            
            randomButton = Int(arc4random_uniform(3))


        }
        
        
        if randomButton == 3 {
            
            answer4.setImage(UIImage(named: picsArray[Int(trueAnswer)]), forState: UIControlState.Normal)
            
            foundValue4 = 1
            
            let picsArrayValue = UInt32(picsArray.count)
            
            randomChoice = Int(arc4random_uniform(picsArrayValue))
            
            answer2.setImage(UIImage(named: picsArray[Int(randomChoice)]), forState: UIControlState.Normal)
            
            randomChoice = Int(arc4random_uniform(picsArrayValue))
            
            answer3.setImage(UIImage(named: picsArray[Int(randomChoice)]), forState: UIControlState.Normal)
            
            randomChoice = Int(arc4random_uniform(picsArrayValue))
            
            answer1.setImage(UIImage(named: picsArray[Int(randomChoice)]), forState: UIControlState.Normal)
            
            randomChoice = Int(arc4random_uniform(picsArrayValue))
            
            randomButton = Int(arc4random_uniform(3))


        }
    }
    
    
    func reappear() {
        
        setupImage()
        correctAnswer()
        delayPic()

    }
    

// This function first shows the question and than shows the choices

    func delayPic() {
        
        answer1.alpha = 0
        answer2.alpha = 0
        answer3.alpha = 0
        answer4.alpha = 0
        questionPic.alpha = 1
        
        delay(1.0) {
            self.answer1.alpha = 1
            self.answer2.alpha = 1
            self.answer3.alpha = 1
            self.answer4.alpha = 1
            self.questionPic.alpha = 0
            
        }
        
    
    }
    
//  Counter from 50 to 0
    
    func reverseCounter() {
        
        timeValue = timeValue - 1
        
        timeLabel.text = String(timeValue)
        
    }

//  Makes delay inside the function
    
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
    
// This function take the Attention View to Records View
    
    func timeToMoveOn() {
        
        recordsOperation.append(String(points))
        
        NSUserDefaults.standardUserDefaults().setObject(recordsOperation, forKey: "recordsOperation")
        
        
        self.performSegueWithIdentifier("goToAttentionResults", sender: self)
    }



}
