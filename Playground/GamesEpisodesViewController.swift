//
//  GamesEpisodesViewController.swift
//  Playground
//
//  Created by Mehmet Alper Duran on 01/05/16.
//  Copyright © 2016 Alper Duran. All rights reserved.
//

import UIKit

class GamesEpisodesViewController: UIViewController, UIScrollViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        translator() // translates the labels
        
        scrollView.delegate = self

        // Do any additional setup after loading the view.
        
        // NSObject that runs doAnimation function in every 0.1 seconds
        
        timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: #selector(GamesEpisodesViewController.doAnimation), userInfo: nil, repeats: true)
        
        
        timer2 = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: #selector(GamesEpisodesViewController.doAnimation2), userInfo: nil, repeats: true)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    var timer = NSTimer()
    var timer2 = NSTimer()
    var counterOperation:Int = 0
    var counterAttention:Int = 0
    
    @IBOutlet weak var attentionImage: UIImageView!
    @IBOutlet weak var operationImage: UIImageView!
    @IBOutlet weak var wordLabel: UILabel!
    @IBOutlet weak var attentionLabel: UILabel!
    @IBOutlet weak var operationsLabel: UILabel!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var scrollView: UIScrollView!
    
    
    func translator() {
        
        if languageChoice == 1 {
            wordLabel.text = "Pun"
            attentionLabel.text = "Attention Game"
            operationsLabel.text = "Math Game"
        }
        
        if languageChoice == 0 {
            wordLabel.text = "Kelime Oyunu"
            attentionLabel.text = "Dikkat Oyunu"
            operationsLabel.text = "Dört İşlem Oyunu"
        }
    }
    
    func doAnimation() {
        if counterOperation == 23 {
            counterOperation = 1
        }
        else {
            counterOperation += 1
        }
        
        
   
        operationImage.image = UIImage(named: "artı\(counterOperation).png")

    }
    
    
    func doAnimation2() {
        if counterAttention == 23 {
            counterAttention = 1
        }
        else {
            counterAttention += 1
        }
        
        
        
        attentionImage.image = UIImage(named: "attentionGif\(counterOperation).tiff")
        
        
    }
    
    // function for horizontal slide

    func scrollViewDidEndDecelerating(scrollView: UIScrollView){ // This function makes slider move vertically
        
        let pageWidth: CGFloat = CGRectGetWidth(scrollView.frame)
        
        let currentPage: CGFloat = floor((scrollView.contentOffset.x - pageWidth/2) / pageWidth) + 1
        
        self.pageControl.currentPage = Int(currentPage)
    }

    

}
