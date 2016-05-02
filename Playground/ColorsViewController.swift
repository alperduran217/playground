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
    
// !!== PRE-LOAD == !!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let image = UIImage(named: picsArray[Int(randomNumber)]) as UIImage? // takes random image from array
        
        button.setImage(image, forState: .Normal) // sets button to that random image
        
        button.frame = CGRectMake(70, 200, 250, 250) // sets the location of the button
        
        button.setTitle("", forState: UIControlState.Normal) // sets the title of the button
        
        button.addTarget(self, action: #selector(ColorsViewController.buttonAction(_:)), forControlEvents: UIControlEvents.TouchUpInside) // this line makes the button actionable button
        
        self.view.addSubview(button) // delegates to add sub view
        
        
        if languageChoice == 0 {
            
            namesArray = namesArrayTur
        }
        
        if languageChoice == 1 {
            
            namesArray = namesArrayEng
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
      
    }
    
// !!== UI Outlet Objects == !!

    @IBOutlet weak var label: UILabel!

// !!== VARIABLES == !!
    
    let button = UIButton() // creating button programmatically
    
    let speechSynthesizer = AVSpeechSynthesizer() // creates a constant for text-to-speech
    
    var picsArray:[String] = ["blue.png","green.png","orange.png","red.png","yellow.png"]
    
    var namesArrayEng:[String] = ["blue","green","orange","red","yellow"]
    
    var namesArrayTur:[String] = ["Mavi","Yeşil","Turuncu","Kırmızı","Sarı"]
    
    var namesArray:[String] = []
    
    var randomNumber = arc4random_uniform(5)
    
// !!== FUNCTIONS == !!
    
    // function makes button clickable
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
