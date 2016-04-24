//
//  AttentionViewController.swift
//  Playground
//
//  Created by Mehmet Alper Duran on 24/04/16.
//  Copyright © 2016 Alper Duran. All rights reserved.
//

import UIKit

class AttentionViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        answer1.alpha = 0
        answer2.alpha = 0
        answer3.alpha = 0
        answer4.alpha = 0
        questionPic.alpha = 0

  
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var questionPic: UIImageView!
    @IBOutlet weak var answer1: UIButton!
    @IBOutlet weak var answer2: UIButton!
    @IBOutlet weak var answer3: UIButton!
    @IBOutlet weak var answer4: UIButton!
    @IBAction func answerAction1(sender: AnyObject) {
        setupImage()
        correctAnswer()
        delayPic()
    }
    @IBAction func answerAction2(sender: AnyObject) {
        setupImage()
        correctAnswer()
        delayPic()
    }
    @IBAction func answerAction3(sender: AnyObject) {
        setupImage()
        correctAnswer()
        delayPic()
    }
    @IBAction func answerAction4(sender: AnyObject) {
        setupImage()
        correctAnswer()
        delayPic()
    }
    @IBAction func startAction(sender: AnyObject) {
        
        start.alpha = 0
        // timer lets decrease counter
        
        timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: #selector(OperationViewController.reverseCounter), userInfo: nil, repeats: true)
        

        
        setupImage()
        correctAnswer()
        delayPic()
    }
    
    @IBOutlet weak var pointsLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var start: UIButton!
    
    var timer = NSTimer()
    var timer2 = NSTimer()
    
    var timeValue = 50
    
    var foundValue = 0
    
    var randomButton:Int = -1
    
    var randomChoice:Int = 0
    
    var trueAnswer:Int = -1
    
    var picsArray:[String] = ["blue.png","green.png","orange.png","red.png","yellow.png","apple.png","apricot.png","avocado.png","banana.png","beans.png","blackberry.png","carrot.png","cherry.png","corn.png","cucumber.png","grapes.png","green apple.png","lemon.png","orang.png","peach.png","pear.png","pepper.png","pomegranate.png","strawberry.png","tomatos.png","watermelon.png","parallelogram.png","star.png","rectangle.png","heart.png","square.png","triangle.png","oval.png","circle.png","trapezoid.png","deltoid.png","pentagon.png","hexagon.png","monkey.png","lion.png","snake.png","zebra.png","giraffe.png","elephant.png","crocodile.png","cat.png"]

    func setupImage() {
        
        let picsArrayValue = UInt32(picsArray.count)
        
        randomChoice = Int(arc4random_uniform(picsArrayValue))
        trueAnswer = randomChoice
        questionPic.image = UIImage(named: picsArray[Int(trueAnswer)])
        randomChoice = Int(arc4random_uniform(picsArrayValue))
        answer1.setImage(UIImage(named: picsArray[Int(randomChoice)]), forState: UIControlState.Normal)
        randomChoice = Int(arc4random_uniform(picsArrayValue))
        answer2.setImage(UIImage(named: picsArray[Int(randomChoice)]), forState: UIControlState.Normal)
        randomChoice = Int(arc4random_uniform(picsArrayValue))
        answer3.setImage(UIImage(named: picsArray[Int(randomChoice)]), forState: UIControlState.Normal)
        randomChoice = Int(arc4random_uniform(picsArrayValue))
        answer4.setImage(UIImage(named: picsArray[Int(randomChoice)]), forState: UIControlState.Normal)
        randomChoice = Int(arc4random_uniform(picsArrayValue))

    }
    
    func correctAnswer() {
        randomButton = Int(arc4random_uniform(3))
        
        if randomButton == 0 {
            
            
            answer1.setImage(UIImage(named: picsArray[Int(trueAnswer)]), forState: UIControlState.Normal)

        }
        
        
        if randomButton == 1 {
            answer2.setImage(UIImage(named: picsArray[Int(trueAnswer)]), forState: UIControlState.Normal)

            
        }
        
        
        if randomButton == 2 {
            
            answer3.setImage(UIImage(named: picsArray[Int(trueAnswer)]), forState: UIControlState.Normal)

        }
        
        
        if randomButton == 3 {
            
            answer4.setImage(UIImage(named: picsArray[Int(trueAnswer)]), forState: UIControlState.Normal)

        }
    }
    

    
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
    
    func reverseCounter() {
        
        timeValue = timeValue - 1
        
        timeLabel.text = String(timeValue)
        
    }

    
    
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
