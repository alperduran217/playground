//
//  AlphabetENViewController.swift
//  Playground
//
//  Created by Mehmet Alper Duran on 14/04/16.
//  Copyright © 2016 Alper Duran. All rights reserved.
//

import UIKit
import QuartzCore
import AVFoundation

class AlphabetENViewController: UIViewController {

// !!== PRE-LOAD == !!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let image = UIImage(named: picsArray[Int(randomNumber)]) as UIImage? // takes random image from array
        
        button.setImage(image, forState: .Normal) // sets button to that random image
        
        button.frame = CGRectMake(70, 200, 250, 250) // sets the location of the button
        
        label.frame = CGRectMake(70, 250, 100, 100) // sets the title of the button
        
        button.setTitle("", forState: UIControlState.Normal)
        
        button.addTarget(self, action: #selector(AlphabetENViewController.buttonAction(_:)), forControlEvents: UIControlEvents.TouchUpInside) // this line makes the button actionable button

        
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

    var namesArray:[String] = []
    let speechSynthesizer = AVSpeechSynthesizer() // creates a constant for text-to-speech

    var picsArray:[String] = ["A.png","B.png","C.png","D.png","E.png","F.png","G.png","H.png","I.png","J.png","K.png","L.png","M.png","N.png","O.png","P.png","Q.png","R.png","S.png","T.png","U.png","V.png","W.png","X.png","Y.png","Z.png"]
    var namesArrayEng:[String] = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"]
    
    var randomNumber = arc4random_uniform(26)
    
    let button = UIButton() // creating button programmatically
    
    var namesArrayTur:[String] = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"]

    
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
            self.randomNumber = arc4random_uniform(26)
            
            
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
