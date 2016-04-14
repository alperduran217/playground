//
//  AnimalsENViewController.swift
//  Playground
//
//  Created by Mehmet Alper Duran on 03/04/16.
//  Copyright © 2016 Alper Duran. All rights reserved.
//

import UIKit
import QuartzCore
import AVFoundation

class AnimalsENViewController: UIViewController {
    
//  PRE-LOAD
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        let image = UIImage(named: picsArray[Int(randomNumber)]) as UIImage?
        
        button.setImage(image, forState: .Normal)
        
        button.frame = CGRectMake(70, 200, 250, 250)
        
        button.setTitle("Test Button", forState: UIControlState.Normal)
        
        button.addTarget(self, action: #selector(AnimalsViewController.buttonAction(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        
        self.view.addSubview(button)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//  VARIABLES
    @IBOutlet weak var label: UILabel!
    
    let speechSynthesizer = AVSpeechSynthesizer()
    var picsArray:[String] = ["dog.png","rabbit.png","cat.png","giraffe.png","bear.png","cow.png","frog.png","zebra.png","monkey.png","koala.png","elephant.png","pig.png","sheep.png","duck.png","lion.png","snake.png","hippopotamus.png","crocodile.png","cangroo.png","chimp.png","chicken.png","goat.png","horse.png","bee.png","butterfly.png","fish.png"]
    var namesArray:[String] = ["dog","rabbit","cat","giraffe","bear","cow","frog","zebra","monkey","koala","elephant","pig","sheep","duck","lion","snake","hippopotamus","crocodile","cangroo","chimp","chicken","goat","horse","bee","butterfly","fish"]
    
    var randomNumber = arc4random_uniform(25)
    
    let button = UIButton()
    
//  FUNCTIONS
    
    func buttonAction(sender:UIButton!)
    {
        
        
        
        let speechUtterance = AVSpeechUtterance(string: namesArray[Int(randomNumber)])
        
        speechUtterance.voice = AVSpeechSynthesisVoice(language: "en-US")
        
        speechSynthesizer.speakUtterance(speechUtterance)
        
        delay(2.0) {
            
            
            self.randomNumber = arc4random_uniform(25)
            
            
            self.button.setImage(UIImage(named: self.picsArray[Int(self.randomNumber)]), forState: UIControlState.Normal)
            
            self.label.text = ""
            
        }
        
        label.text = namesArray[Int(randomNumber)]
        
        
    }
    
    //  Delay function for button
    
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
