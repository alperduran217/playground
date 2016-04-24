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
        doOperation()

 
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    var points:Int = 0
    
    var operation = 0
    
    var button1Value = 0
    
    var button2Value = 0
    
    var randomChoice:Int = 0
    
    var randomNumber:Int = -1
    
    var labelRandomNumber1:Int = -1
    
    var labelRandomNumber2:Int = -1
    
    var result:Int = 0
    
    var fakeResult:Int = 0

    @IBOutlet var operationView: UIView!
    @IBOutlet weak var multi: UILabel!
    @IBOutlet weak var div: UILabel!
    @IBOutlet weak var minus: UILabel!
    @IBOutlet weak var add: UILabel!
    @IBOutlet weak var start: UIButton!
    
    @IBAction func startAction(sender: AnyObject) {
        start.alpha = 0
    }
    @IBAction func button2Act(sender: AnyObject) {
        
        doOperation()
        button2Answer()
        
    }
    @IBAction func button1act(sender: AnyObject) {
        
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
        if operation == 1 {
            
            div.alpha = 1
            add.alpha = 0
            minus.alpha = 0
            multi.alpha = 0
            
        }
        
        if operation == 2 {
            div.alpha = 0
            add.alpha = 1
            minus.alpha = 0
            multi.alpha = 0
        }
        
        
        if operation == 3 {
            div.alpha = 0
            add.alpha = 0
            minus.alpha = 1
            multi.alpha = 0
        }
        
        
        if operation == 4 {
            div.alpha = 0
            add.alpha = 0
            minus.alpha = 0
            multi.alpha = 1
        }
        
    }
    
    func buttonSelect() {
        
        
        randomNumber = Int(arc4random_uniform(5))
        
        operation = randomNumber
        
        if operation == 0 {
            
            randomNumber = Int(arc4random_uniform(5))
            
            operation = randomNumber

        }
        
        disableButton()
        randomLabelNumbers()
        
      
        
        
    }
    
    func doOperation() {
        
        buttonSelect()
        
        if operation == 1 {
            
            result = labelRandomNumber1 / labelRandomNumber2
            fakeResult = result + randomNumber
            
            if randomChoice == 0{
                
                button1.setTitle("\(result)", forState: .Normal)
                button2.setTitle("\(fakeResult)", forState: .Normal)
                
                button1Value = result
                button2Value = fakeResult
                
                randomChoice = Int(arc4random_uniform(2))

        
            }
            
            
            if randomChoice == 1{
                button1.setTitle("\(fakeResult)", forState: .Normal)
                button2.setTitle("\(result)", forState: .Normal)
                
                button2Value = result
                button1Value = fakeResult
                
                randomChoice = Int(arc4random_uniform(2))

            }
            
            

        }
        
        if operation == 2 {
            
            result = labelRandomNumber1 + labelRandomNumber2
            fakeResult = result + randomNumber
            
            if randomChoice == 0{
                
                button1.setTitle("\(result)", forState: .Normal)
                button2.setTitle("\(fakeResult)", forState: .Normal)
                
                button1Value = result
                button2Value = fakeResult
                
            }
            
            
            if randomChoice == 1{
                button1.setTitle("\(fakeResult)", forState: .Normal)
                button2.setTitle("\(result)", forState: .Normal)
                
                
                button2Value = result
                button1Value = fakeResult
            }
            
            randomChoice = Int(arc4random_uniform(2))

        }
        
        if operation == 3 {
            result = labelRandomNumber1 - labelRandomNumber2
            fakeResult = result + randomNumber
            
            if randomChoice == 0{
                
                button1.setTitle("\(result)", forState: .Normal)
                button2.setTitle("\(fakeResult)", forState: .Normal)
                
                button1Value = result
                button2Value = fakeResult
            }
            
            
            if randomChoice == 1{
                button1.setTitle("\(fakeResult)", forState: .Normal)
                button2.setTitle("\(result)", forState: .Normal)
                
                
                button2Value = result
                button1Value = fakeResult
            }
            
            randomChoice = Int(arc4random_uniform(2))

        }
        
        if operation == 4 {
            result = labelRandomNumber1 * labelRandomNumber2
            fakeResult = result + randomNumber
            
            if randomChoice == 0{
                
                button1.setTitle("\(result)", forState: .Normal)
                button2.setTitle("\(fakeResult)", forState: .Normal)
                
                button1Value = result
                button2Value = fakeResult
            }
            
            
            if randomChoice == 1{
                button1.setTitle("\(fakeResult)", forState: .Normal)
                button2.setTitle("\(result)", forState: .Normal)
                
                
                button2Value = result
                button1Value = fakeResult
            }
            
            randomChoice = Int(arc4random_uniform(2))

        }
    
    }
    
    
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
    
    func button1Answer() {
        
        if button1Value == result {
            self.view.backgroundColor = UIColor.greenColor()
            
            points = points + 10

            pointsLabel.text = String(points)

            delay(0.2) {
                self.view.backgroundColor = UIColor.whiteColor()

            }
        }
        
        if button1Value == fakeResult {
            self.view.backgroundColor = UIColor.redColor()
            
            delay(0.2) {
                self.view.backgroundColor = UIColor.whiteColor()
                
            }
        }
        
        }
    func button2Answer() {
        
        if button2Value == result {
            self.view.backgroundColor = UIColor.greenColor()
            
            points = points + 10
            
            pointsLabel.text = String(points)
            
            delay(0.2) {
                self.view.backgroundColor = UIColor.whiteColor()
                
            }
        }
        
        if button2Value == fakeResult {
            self.view.backgroundColor = UIColor.redColor()
            
            delay(0.2) {
                self.view.backgroundColor = UIColor.whiteColor()
                
            }
        }
        
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
