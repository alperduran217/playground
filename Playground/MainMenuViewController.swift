//
//  MainMenuViewController.swift
//  Playground
//
//  Created by Mehmet Alper Duran on 08/04/16.
//  Copyright © 2016 Alper Duran. All rights reserved.
//

import UIKit
import AVFoundation
import SpriteKit


class MainMenuViewController: UIViewController {

    
// !!== PRE-LOAD == !!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
         translator()

        
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
            print("AVAudioSession Category Playback OK")
            do {
                try AVAudioSession.sharedInstance().setActive(true)
                print("AVAudioSession is Active")
            } catch let error as NSError {
                print(error.localizedDescription)
            }
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        playBackgroundMusic("mainMenuSong.m4a")

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
// !!== UI Outlet Objects == !!

    @IBOutlet weak var startLabel: UILabel!
    
    @IBOutlet weak var settingsLabel: UILabel!
    
// !!== Variables == !!
    
    var backgroundMusicPlayer = AVAudioPlayer()

    
// !!== Functions == !!
    
    // translates the labels with the language choice variable's value
    func translator() {
        
        if languageChoice == 1 {
            startLabel.text = "START"
            settingsLabel.text = "LANGUAGES"
        }
        
        if languageChoice == 0 {
            startLabel.text = "BAŞLAT"
            settingsLabel.text = "DİL AYARI"
        }
        
    }
    
    
    
    // this function plays music on background
    
    func playBackgroundMusic(filename: String) {
        let url = NSBundle.mainBundle().URLForResource(filename, withExtension: nil)
        guard let newURL = url else {
            print("Could not find file: \(filename)")
            return
        }
        do {
            backgroundMusicPlayer = try AVAudioPlayer(contentsOfURL: newURL)
            backgroundMusicPlayer.numberOfLoops = -1
            backgroundMusicPlayer.prepareToPlay()
            backgroundMusicPlayer.play()
        } catch let error as NSError {
            print(error.description)
        }
    }
    


}
