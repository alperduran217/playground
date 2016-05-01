//
//  EpisodesPageTwoViewController.swift
//  Playground
//
//  Created by Mehmet Alper Duran on 30/04/16.
//  Copyright © 2016 Alper Duran. All rights reserved.
//

import UIKit

class EpisodesPageTwoViewController: UIViewController , UIScrollViewDelegate{

    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.delegate = self

        translatorEpisodesPageTwo()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var fruitsLabel: UILabel!
    @IBOutlet weak var colorsLabel: UILabel!
    @IBOutlet weak var scrollView: UIScrollView!

    @IBOutlet weak var pageControl: UIPageControl!
 
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
