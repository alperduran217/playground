//
//  ShapesENViewController.swift
//  Playground
//
//  Created by Mehmet Alper Duran on 03/04/16.
//  Copyright © 2016 Alper Duran. All rights reserved.
//

import UIKit
import QuartzCore
import AVFoundation

class ShapesENViewController: UIViewController {

    
    let button = UIButton()
    
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
    
    var picsArray:[String] = ["parallelogram.png","star.png","rectangle.png","heart.png","square.png","triangle.png","oval.png","circle.png","trapezoid.png","deltoid.png","pentagon.png","hexagon.png"]
    var namesArray:[String] = ["parallelogram", "star", "rectangle", "heart", "square", "triangle", "oval", "circle", "trapezoid", "deltoid", "pentagon", "hexagon"]
    
    var randomNumber = arc4random_uniform(12)
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    let speechSynthesizer = AVSpeechSynthesizer()
    
    func buttonAction(sender:UIButton!)
    {
        
        let speechUtterance = AVSpeechUtterance(string: namesArray[Int(randomNumber)])
        speechUtterance.voice = AVSpeechSynthesisVoice(language: "en-US")

        speechSynthesizer.speakUtterance(speechUtterance)
        
        randomNumber = arc4random_uniform(12)
        
        
        
        
        
        
        
        button.setImage(UIImage(named: picsArray[Int(randomNumber)]), forState: UIControlState.Normal)
        
        
        
    }
}
