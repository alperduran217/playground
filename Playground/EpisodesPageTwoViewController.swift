//
//  EpisodesPageTwoViewController.swift
//  Playground
//
//  Created by Mehmet Alper Duran on 30/04/16.
//  Copyright © 2016 Alper Duran. All rights reserved.
//

import UIKit

class EpisodesPageTwoViewController: UIViewController , UIScrollViewDelegate{
    
    // !!== PRE-LOAD == !!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // this delegate, delegates itself for moving on x- axis
        scrollView.delegate = self

        
        //translates the label on page 2
        translatorEpisodesPageTwo()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // !!== UI OUTLET OBJECTS == !!

    
    @IBOutlet weak var fruitsLabel: UILabel! //UI Object where hold the fruits label
    @IBOutlet weak var colorsLabel: UILabel! //UI Object where hold the colors label
    @IBOutlet weak var scrollView: UIScrollView! // scrollView UI Object for slide the page on x-axis
    @IBOutlet weak var pageControl: UIPageControl! // scrollView UI Object for slide the page on x-axis
    
    
    // !!== FUNCTIONS == !!
 
    func translatorEpisodesPageTwo() {
        
        if languageChoice == 1 {
           fruitsLabel.text = "Fruits and Veggies"
            colorsLabel.text = "Colors"
            
        }
        
        if languageChoice == 0 {
            fruitsLabel.text = "Meyveler ve Sebzeler"
            colorsLabel.text = "Renkler"
            
        }
        
        
    }

    
    // This function makes slider move 
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView){
        
        let pageWidth: CGFloat = CGRectGetWidth(scrollView.frame)
        
        let currentPage: CGFloat = floor((scrollView.contentOffset.x - pageWidth/2) / pageWidth) + 1
        
        self.pageControl.currentPage = Int(currentPage)
    }
}
