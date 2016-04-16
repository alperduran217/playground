//
//  ColorsViewController.swift
//  Playground
//
//  Created by Mehmet Alper Duran on 14/04/16.
//  Copyright © 2016 Alper Duran. All rights reserved.
//

import UIKit
import QuartzCore
import AVFoundation

class ColorsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        let image = UIImage(named: picsArray[Int(randomNumber)]) as UIImage?
        
        button.setImage(image, forState: .Normal)
        
        button.frame = CGRectMake(70, 200, 250, 250)
        
        button.setTitle("", forState: UIControlState.Normal)
        
        button.addTarget(self, action: #selector(ColorsViewController.buttonAction(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        
        self.view.addSubview(button)
        
        
        if languageChoice == 0 {
            
            namesArray = namesArrayTur
        }
        
        if languageChoice == 1 {
            
            namesArray = namesArrayEng
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
      
    }
    
    @IBOutlet weak var label: UILabel!

    
    let button = UIButton()
    
    let speechSynthesizer = AVSpeechSynthesizer()
    
    var picsArray:[String] = ["blue.png","green.png","orange.png","red.png","yellow.png"]
    
    var namesArrayEng:[String] = ["blue","green","orange","red","yellow"]
    
    var namesArrayTur:[String] = ["Mavi","Yeşil","Turuncu","Kırmızı","Sarı"]
    
    var namesArray:[String] = []

    
    var randomNumber = arc4random_uniform(5)
    
    //  FUNCTIONS
    
    func buttonAction(sender:UIButton!)
    {
        
        button.enabled = false

        
        let speechUtterance = AVSpeechUtterance(string: namesArray[Int(randomNumber)])
        
        if languageChoice == 1 {
            
            speechUtterance.voice = AVSpeechSynthesisVoice(language: "en-US")
            
        }
        speechSynthesizer.speakUtterance(speechUtterance)
        
        delay(2.0) {
            
            self.button.enabled = true

            self.randomNumber = arc4random_uniform(5)
            
            
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
