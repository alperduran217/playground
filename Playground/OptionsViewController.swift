//
//  OptionsViewController.swift
//  Playground
//
//  Created by Mehmet Alper Duran on 16/04/16.
//  Copyright © 2016 Alper Duran. All rights reserved.
//

import UIKit

public var languageChoice:Int = 0

class OptionsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func turkishLang(sender: AnyObject) {
        
        languageChoice = 0
        
    }
    
    @IBAction func englishLang(sender: AnyObject) {
        
        languageChoice = 1 
        
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}