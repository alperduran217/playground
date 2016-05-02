//
//  EpisodesViewController.swift
//  Playground
//
//  Created by Mehmet Alper Duran on 03/04/16.
//  Copyright © 2016 Alper Duran. All rights reserved.
//

import UIKit

class EpisodesViewController: UIViewController, UIScrollViewDelegate {

// !!== PRE-LOAD == !!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.delegate = self // this delegate, delegates itself for moving on x- axis
        
        translatorEpisodes() // translates the labels
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
// !!== UI Outlet Objects == !!
  
    @IBOutlet weak var alphabetsLabel: UILabel!
    @IBOutlet weak var shapesLabel: UILabel!

    @IBOutlet weak var animalsLabel: UILabel!
    
    @IBOutlet weak var pageControl: UIPageControl!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
// !!== FUNCTIONS == !!
    
    // translates the labels with the language choice variable's value
    func translatorEpisodes() {
        
        if languageChoice == 1 {
            animalsLabel.text = "Animals"
            shapesLabel.text = "Shapes"
            alphabetsLabel.text = "Alphabets"

        }
        
        if languageChoice == 0 {
            animalsLabel.text = "Hayvanlar"
            shapesLabel.text = "Şekiller"
            alphabetsLabel.text = "Harfler"
            
        }
        
      
    }
    // function for horizontal slide
    func scrollViewDidEndDecelerating(scrollView: UIScrollView){ // This function makes slider move vertically
        
        let pageWidth: CGFloat = CGRectGetWidth(scrollView.frame)
        
        let currentPage: CGFloat = floor((scrollView.contentOffset.x - pageWidth/2) / pageWidth) + 1
        
        self.pageControl.currentPage = Int(currentPage)
    }
}
