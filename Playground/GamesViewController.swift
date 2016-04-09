//
//  GamesViewController.swift
//  Playground
//
//  Created by Mehmet Alper Duran on 09/04/16.
//  Copyright © 2016 Alper Duran. All rights reserved.
//

import UIKit

class GamesViewController: UIViewController, UIScrollViewDelegate{
    
//  PRE-LOAD

    override func viewDidLoad() {
        super.viewDidLoad()

         scrollView.delegate = self
        
        // Do any additional setup after loading the view.
        
    timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: #selector(GamesViewController.doAnimation), userInfo: nil, repeats: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

// MAIN STORYBOARD
    
    @IBOutlet weak var tigerImage: UIImageView!
    
    @IBOutlet weak var bookImage: UIImageView!

    @IBOutlet weak var pageControl: UIPageControl!

    @IBOutlet weak var scrollView: UIScrollView!
    
// VARIABLES
    
    var counterBook = 1
    
    var counterTiger = 1
    
    var timer = NSTimer()
    
    var isAnimating = true
    
// FUNCTIONS
    
    
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
        
        
        bookImage.image = UIImage(named: "book\(counterBook).tiff")
        tigerImage.image = UIImage(named: "tiger\(counterTiger).tiff")

        
        
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView){ // This function makes slider move vertically
        
        let pageWidth: CGFloat = CGRectGetWidth(scrollView.frame)
        
        let currentPage: CGFloat = floor((scrollView.contentOffset.x - pageWidth/2) / pageWidth) + 1
        
        self.pageControl.currentPage = Int(currentPage)
    }

    

}
