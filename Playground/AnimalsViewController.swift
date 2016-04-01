//
//  AnimalsViewController.swift
//  Playground
//
//  Created by Mehmet Alper Duran on 1.04.2016.
//  Copyright © 2016 Alper Duran. All rights reserved.
//

import UIKit
import QuartzCore
import AVFoundation

class AnimalsViewController: UIViewController {
    
    var temp = -1

    let button = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        
        let image = UIImage(named: picsArray[Int(randomNumber)]) as UIImage?
        


        button.setImage(image, forState: .Normal)
        button.frame = CGRectMake(100, 100, 100, 100)
        button.setTitle("Test Button", forState: UIControlState.Normal)
        button.addTarget(self, action: #selector(AnimalsViewController.buttonAction(_:)), forControlEvents: UIControlEvents.TouchUpInside)

        self.view.addSubview(button)


    }
 
    var picsArray:[String] = ["dog.png","rabbit.png","cat.png","girraffe.png","bear.png","cow.png","frog.png","zebra.png","monkey.png","koala.png","elephant.png","pig.png","sheep.png","duck.png","lion.png","snake.png","hippopotamus.png","crocodile.png","cangroo.png","chimp.png","chicken.png","goat.png","horse.png","bee.png","butterfly.png","fish.png"]
    var namesArray:[String] = ["köpek","tavşan","kedi","zürafa","ayı","inek","kurbağa","zebra","maymun","koala","fil","domuz","koyun","ördek","aslan","yılan","su aygırı","timsah","kanguru","şempanze","tavuk","keçi","at","arı","kelebek","balık"]
    
    var randomNumber = arc4random_uniform(25)

  
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    let speechSynthesizer = AVSpeechSynthesizer()
    
    func buttonAction(sender:UIButton!)
    {
        
        let speechUtterance = AVSpeechUtterance(string: namesArray[Int(randomNumber)])
        
        speechSynthesizer.speakUtterance(speechUtterance)
    
        if temp == Int(randomNumber) {
            randomNumber = arc4random_uniform(25)
            temp = Int(randomNumber)


        }
        
        else {
            temp = Int(randomNumber)
            randomNumber = arc4random_uniform(25)

        }
        
        button.setImage(UIImage(named: picsArray[Int(randomNumber)]), forState: UIControlState.Normal)

    
    
    }

}
