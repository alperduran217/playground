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

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let image = UIImage(named: picsArray[Int(randomNumber)]) as UIImage?
        
        button.setImage(image, forState: .Normal)
        
        button.frame = CGRectMake(70, 200, 250, 250)
        
        button.setTitle("", forState: UIControlState.Normal)
        
        button.addTarget(self, action: #selector(FruitsViewController.buttonAction(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        
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
    
// VARIABLES
    
    var namesArray:[String] = []
    
    @IBOutlet weak var label: UILabel!
    
    let button = UIButton()
    
    let speechSynthesizer = AVSpeechSynthesizer()
    
    var picsArray:[String] = ["apple.png","apricot.png","avocado.png","banana.png","beans.png","blackberry.png","carrot.png","cherry.png","corn.png","cucumber.png","grapes.png","green apple.png","lemon.png","orang.png","peach.png","pepper.png","pomegranate.png","strawberry.png","tomatos.png","watermelon.png"]
    
    var namesArrayEng:[String] = ["Apple","Apricot","Avocado","Banana","Beans","Blackberry","Carrot","Cherry","Corn","Cucumber","Grapes","Green Apple", "Lemon","Orange","Peach","Pepper","Pomegrante","Strawberry","Tomatos","Watermelon"]
    
    var namesArrayTur:[String] = ["Elma","Kayısı","Avokado","Muz","Fasulye","Böğürtlen","Havuç","Kiraz","Mısır","Salatalık","Üzüm","Yeşil Elma", "Limon", "Portakal","Şeftali","Biber","Nar","Çilek","Domates","Karpuz"]
    
    var randomNumber = arc4random_uniform(20)
    
    //  FUNCTIONS
    
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
