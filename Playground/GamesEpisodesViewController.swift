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
        
        //NSOBject that runs doAnimation2 function in every 0.1 seconds
        
        timer2 = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: #selector(GamesEpisodesViewController.doAnimation2), userInfo: nil, repeats: true)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    var timer = NSTimer() // NSObject for animations
    var timer2 = NSTimer()
    var counterOperation:Int = 0 //This counter holds the frame of the animation Operation
    var counterAttention:Int = 0 //This counter holds the frame of the animation Attention
    
    @IBOutlet weak var attentionImage: UIImageView! // UI Object where attention animation's first frame holds
    @IBOutlet weak var operationImage: UIImageView! // UI Object where operation animation's first frame holds
    @IBOutlet weak var wordLabel: UILabel!
    @IBOutlet weak var attentionLabel: UILabel! // UI Object where attention label's text holds
    @IBOutlet weak var operationsLabel: UILabel! // UI Object where operation label's text holds
    @IBOutlet weak var pageControl: UIPageControl! // pageControl UI Object for navigate the page
    @IBOutlet weak var scrollView: UIScrollView! // scrollView UI Object for slide the page on x-axis
    
    // translates the labels with the language choice variable's value
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
    // it's not an animation function. It's just holds the information of the animation. timer(NS Object) does animate. doAnimation runs every n seconds where n is timer's value.
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
