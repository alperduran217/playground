//
//  FruitsViewController.swift
//  Playground
//
//  Created by Mehmet Alper Duran on 14/04/16.
//  Copyright © 2016 Alper Duran. All rights reserved.
//


import UIKit
import QuartzCore
import AVFoundation


class FruitsViewController: UIViewController {
    
// !!== PRE-LOAD == !!

    override func viewDidLoad() {
        super.viewDidLoad()

        let image = UIImage(named: picsArray[Int(randomNumber)]) as UIImage? // takes random image from array

        
        button.setImage(image, forState: .Normal) // sets button to that random image
        
        button.frame = CGRectMake(70, 200, 250, 250) // sets the location of the button
        
        button.setTitle("", forState: UIControlState.Normal) // sets the title of the button
        
        button.addTarget(self, action: #selector(FruitsViewController.buttonAction(_:)), forControlEvents: UIControlEvents.TouchUpInside) // this line makes the button actionable button

        
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

    
    let button = UIButton() // creating button programmatically
    
    let speechSynthesizer = AVSpeechSynthesizer() // creates a constant for text-to-speech
    
    var picsArray:[String] = ["apple.png","apricot.png","avocado.png","banana.png","beans.png","blackberry.png","carrot.png","cherry.png","corn.png","cucumber.png","grapes.png","green apple.png","lemon.png","orang.png","peach.png","pepper.png","pomegranate.png","strawberry.png","tomatos.png","watermelon.png"]
    
    var namesArrayEng:[String] = ["Apple","Apricot","Avocado","Banana","Beans","Blackberry","Carrot","Cherry","Corn","Cucumber","Grapes","Green Apple", "Lemon","Orange","Peach","Pepper","Pomegrante","Strawberry","Tomatos","Watermelon"]
    
    var namesArrayTur:[String] = ["Elma","Kayısı","Avokado","Muz","Fasulye","Böğürtlen","Havuç","Kiraz","Mısır","Salatalık","Üzüm","Yeşil Elma", "Limon", "Portakal","Şeftali","Biber","Nar","Çilek","Domates","Karpuz"]
    
    var randomNumber = arc4random_uniform(20)
    
// !!== FUNCTIONS == !!
    
    // function makes button clickable
    func buttonAction(sender:UIButton!)
    {
        
        button.enabled = false
        
        let speechUtterance = AVSpeechUtterance(string: namesArray[Int(randomNumber)]) // turns the string to speakable constant
        
        if languageChoice == 1 {
            
            speechUtterance.voice = AVSpeechSynthesisVoice(language: "en-US") // this line makes the speech in english
            
        }
        speechSynthesizer.speakUtterance(speechUtterance) // where the speaks happens
        
        
        // delays between two frames
        delay(2.0) {
            
            self.button.enabled = true
            self.randomNumber = arc4random_uniform(21)
            
            
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
