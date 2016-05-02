//
//  GamesViewController.swift
//  Playground
//
//  Created by Mehmet Alper Duran on 09/04/16.
//  Copyright © 2016 Alper Duran. All rights reserved.
//

import UIKit

class GamesViewController: UIViewController, UIScrollViewDelegate{
    
// !!== PRE-LOAD == !!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        translator()
        
         scrollView.delegate = self // this delegate, delegates itself for moving on x- axis
        
        
    timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: #selector(GamesViewController.doAnimation), userInfo: nil, repeats: true)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

// !!== UI Outlet Objects == !!
    @IBOutlet weak var gameImage: UIImageView!
    
    @IBOutlet weak var tigerImage: UIImageView!
    
    @IBOutlet weak var bookImage: UIImageView!

    @IBOutlet weak var pageControl: UIPageControl!

    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var learningLabel: UILabel!
    
    @IBOutlet weak var readingLabel: UILabel!
    
    @IBOutlet weak var gamesLabel: UILabel!
    
// !!== VARIABLES == !!
    
    var counterGame = 1
    
    var counterBook = 1
    
    var counterTiger = 1
    
    var timer = NSTimer()
    
    var isAnimating = true
    
// !!== FUNCTIONS == !!
    
    // translates the labels with the language choice variable's value
    func translator() {
        if languageChoice == 1 {
            learningLabel.text = "Learning"
            readingLabel.text = "Reading"
            gamesLabel.text = "Games"
        }
        if languageChoice == 0 {
            learningLabel.text = "Öğrenme"
            readingLabel.text = "Okuma"
            gamesLabel.text = "Oyunlar"
        }
    }
    
    // it's not an animation function. It's just holds the information of the animation. timer(NS Object) does animate. doAnimation runs every n seconds where n is timer's value.
    func doAnimation() {
        
        
        if counterBook == 8 {
            
            counterBook = 1
            
        } else {
            
            counterBook += 1
            
        }
        
        if counterTiger == 16 {
            
            counterTiger = 1
            
        } else {
            
            counterTiger += 1
            
        }
        
        if counterGame == 17 {
            counterGame = 1
        }
        else {
            counterGame += 1
        }
        
        
        bookImage.image = UIImage(named: "book\(counterBook).tiff")
        tigerImage.image = UIImage(named: "tiger\(counterTiger).tiff")
        gameImage.image = UIImage(named: "gameIcon\(counterGame).png")

        
        
    }
    
    // function for horizontal slide
    func scrollViewDidEndDecelerating(scrollView: UIScrollView){ // This function makes slider move vertically
        
        let pageWidth: CGFloat = CGRectGetWidth(scrollView.frame)
        
        let currentPage: CGFloat = floor((scrollView.contentOffset.x - pageWidth/2) / pageWidth) + 1
        
        self.pageControl.currentPage = Int(currentPage)
    }

    

}
