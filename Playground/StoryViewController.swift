//
//  StoryViewController.swift
//  Playground
//
//  Created by Mehmet Alper Duran on 09/04/16.
//  Copyright © 2016 Alper Duran. All rights reserved.
//

import UIKit
import AVFoundation
import QuartzCore


class StoryViewController: UIViewController, AVSpeechSynthesizerDelegate {
    
//  PRE-LOAD

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // this delegate, delegates itself for moving on x- axis
        speechSynthesizer.delegate = self

        setInitialFontAttribute()


        // Do any additional setup after loading the view.
        
      


        storyText.alpha = 0
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

// MAIN STORYBOARD
    @IBAction func stopSpeech(sender: AnyObject) {
        
        speechSynthesizer.stopSpeakingAtBoundary(AVSpeechBoundary.Immediate)
        
        animateActionButtonAppearance(false)
        
        timer.invalidate()
        timer2.invalidate()
        timer3.invalidate()
        timer4.invalidate()
        timer5.invalidate()
        timer6.invalidate()
        

    }
    
    @IBAction func backButton(sender: AnyObject) {
        speechSynthesizer.stopSpeakingAtBoundary(AVSpeechBoundary.Immediate)
        
        animateActionButtonAppearance(false)
        
        timer.invalidate()
        timer2.invalidate()
        timer3.invalidate()
        timer4.invalidate()
        timer5.invalidate()
        timer6.invalidate()
    }
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var btnStop: UIButton!
    @IBOutlet weak var btnSpeak: UIButton!
    @IBOutlet weak var btnPause: UIButton!
    
    @IBAction func pauseSpeech(sender: AnyObject) {
        
        speechSynthesizer.pauseSpeakingAtBoundary(AVSpeechBoundary.Word)
        
        animateActionButtonAppearance(false)

    }
    
    @IBOutlet weak var storyImage: UIImageView!
    
    @IBOutlet weak var storyText: UITextView!

    @IBOutlet weak var pvSpeechProgress: UIProgressView!
    
    @IBAction func speak(sender: AnyObject) {
        if !speechSynthesizer.speaking {
              timer5 = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: #selector(StoryViewController.doAnimation5), userInfo: nil, repeats: true)
            let textParagraphs = storyText.text.componentsSeparatedByString("\n")
            
            totalUtterances = textParagraphs.count
            currentUtterance = 0
            totalTextLength = 0
            spokenTextLengths = 0
            
            for pieceOfText in textParagraphs {
                let speechUtterance = AVSpeechUtterance(string: pieceOfText)
                
                speechUtterance.postUtteranceDelay = 0.005
                
                totalTextLength = totalTextLength + pieceOfText.utf16.count
                
                speechSynthesizer.speakUtterance(speechUtterance)
            }        
        }
        
        else{
            speechSynthesizer.continueSpeaking()
        }
        
        let speechUtterance = AVSpeechUtterance(string: storyText.text)
        

        
        
        speechSynthesizer.speakUtterance(speechUtterance)
        
        animateActionButtonAppearance(true)

        
   
    }
    
    
// VARIABLES

    let speechSynthesizer = AVSpeechSynthesizer()
    
    var totalUtterances: Int! = 0
    
    var currentUtterance: Int! = 0
    
    var totalTextLength: Int = 0
    
    var spokenTextLengths: Int = 0
    
    var previousSelectedRange: NSRange!
    
    var counterSadBunny = 1
    
    var counterScaredBunny = 1
    
    var counterFrog = 1
    
    var counterFunBunny = 1
    
    var counterRunningBunny = 1
    
    var counterHappBunny = 1

    var timer = NSTimer()
    
    var timer2 = NSTimer()
    
    var timer3 = NSTimer()
    
    var timer4 = NSTimer()
    
    var timer5 = NSTimer()
    
    var timer6 = NSTimer()
    
    var isAnimating = true



// FUNCTIONS
    
    // THis function takes the text string and store all of them by one by
    func setInitialFontAttribute() {
        let rangeOfWholeText = NSMakeRange(0, storyText.text.utf16.count) // This constant takes the range of the text
        let attributedText = NSMutableAttributedString(string: storyText.text) // This constant splits text word by word
        attributedText.addAttribute(NSFontAttributeName, value: UIFont(name: "Arial", size: 18.0)!, range: rangeOfWholeText) //  This object adds the next string into attributedText
        storyText.textStorage.beginEditing()
        storyText.textStorage.replaceCharactersInRange(rangeOfWholeText, withAttributedString: attributedText)
        storyText.textStorage.endEditing()
    }
    
    
    //  The function checks the speech finishes it or not
    func speechSynthesizer(synthesizer: AVSpeechSynthesizer, didFinishSpeechUtterance utterance: AVSpeechUtterance) {
        spokenTextLengths = spokenTextLengths + utterance.speechString.utf16.count + 1
        
        let progress: Float = Float(spokenTextLengths * 100 / totalTextLength)
        pvSpeechProgress.progress = progress / 100
        
        if currentUtterance == totalUtterances {
            
                
            unselectLastWord()
            previousSelectedRange = nil
        }
        
     

    }
    
    // This function takes the next word on the text
    func speechSynthesizer(synthesizer: AVSpeechSynthesizer, didStartSpeechUtterance utterance: AVSpeechUtterance) {
        currentUtterance = currentUtterance + 1

    }
    
    // this function reads the text
    func speechSynthesizer(synthesizer: AVSpeechSynthesizer, willSpeakRangeOfSpeechString characterRange: NSRange, utterance: AVSpeechUtterance) {
        
        let progress: Float = Float(spokenTextLengths + characterRange.location) * 100 / Float(totalTextLength)
        pvSpeechProgress.progress = progress / 100
        
        // Determine the current range in the whole text (all utterances), not just the current one.
        let rangeInTotalText = NSMakeRange(spokenTextLengths + characterRange.location, characterRange.length)
        
        // Select the specified range in the textfield.
        storyText.selectedRange = rangeInTotalText
        
        // Store temporarily the current font attribute of the selected text.
        let currentAttributes = storyText.attributedText.attributesAtIndex(rangeInTotalText.location, effectiveRange: nil)
        let fontAttribute: AnyObject? = currentAttributes[NSFontAttributeName]
        
        // Assign the selected text to a mutable attributed string.
        let attributedString = NSMutableAttributedString(string: storyText.attributedText.attributedSubstringFromRange(rangeInTotalText).string)
        
        // Make the text of the selected area orange by specifying a new attribute.
        attributedString.addAttribute(NSForegroundColorAttributeName, value: UIColor.orangeColor(), range: NSMakeRange(0, attributedString.length))
        
        // Make sure that the text will keep the original font by setting it as an attribute.
        attributedString.addAttribute(NSFontAttributeName, value: fontAttribute!, range: NSMakeRange(0, attributedString.string.utf16.count))
        // In case the selected word is not visible scroll a bit to fix this.
        storyText.scrollRangeToVisible(rangeInTotalText)
        
        // Begin editing the text storage.
        storyText.textStorage.beginEditing()
        
        // Replace the selected text with the new one having the orange color attribute.
        storyText.textStorage.replaceCharactersInRange(rangeInTotalText, withAttributedString: attributedString)
        
        // If there was another highlighted word previously (orange text color), then do exactly the same things as above and change the foreground color to black.
        if let previousRange = previousSelectedRange {
            let previousAttributedText = NSMutableAttributedString(string: storyText.attributedText.attributedSubstringFromRange(previousRange).string)
            previousAttributedText.addAttribute(NSForegroundColorAttributeName, value: UIColor.blackColor(), range: NSMakeRange(0, previousAttributedText.length))
            previousAttributedText.addAttribute(NSFontAttributeName, value: fontAttribute!, range: NSMakeRange(0, previousAttributedText.length))
            
            storyText.textStorage.replaceCharactersInRange(previousRange, withAttributedString: previousAttributedText)
        }
        
        // End editing the text storage.
        storyText.textStorage.endEditing()
        
        // Keep the currently selected range so as to remove the orange text color next.
        previousSelectedRange = rangeInTotalText
        
        
        if previousSelectedRange.location == 194 {
            
          label.text = "Tavşan korkaklığına daha bir üzülürmüş. "
            
        }

        
        if previousSelectedRange.location == 354 {
            
            label.text = "Korka korka, saklana saklana "
            
        }
        
        
        if previousSelectedRange.location == 466 {
            
            label.text = "vraak vraaaakkk "
            
        }
        
        if previousSelectedRange.location == 705 {
            
            label.text = "O günden sonra tavşan... "
            
            timer3.invalidate()
            
             timer6 = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: #selector(StoryViewController.doAnimation6), userInfo: nil, repeats: true)
        }

        
        if previousSelectedRange.location == 281 {
            
            
            timer5.invalidate()
            timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: #selector(StoryViewController.doAnimation), userInfo: nil, repeats: true)

        }
        
        if previousSelectedRange.location == 425 {
            
            
            timer.invalidate()
            storyImage.image = UIImage(named: "ScaredBunny1.tiff")
            timer2 = NSTimer.scheduledTimerWithTimeInterval(0.3, target: self, selector: #selector(StoryViewController.doAnimation2), userInfo: nil, repeats: true)
            
        }
        
        if previousSelectedRange.location == 526 {
            
            timer2.invalidate()
            timer3 = NSTimer.scheduledTimerWithTimeInterval(0.05, target: self, selector: #selector(StoryViewController.doAnimation3), userInfo: nil, repeats: true)
            
        }
        
        if previousSelectedRange.location == 760 {
            
            speechSynthesizer.stopSpeakingAtBoundary(AVSpeechBoundary.Immediate)
            
            animateActionButtonAppearance(false)
            
            timer.invalidate() // we have to invalidate the timers for memory management
            timer2.invalidate()
            timer3.invalidate()
            timer4.invalidate()
            timer5.invalidate()
            timer6.invalidate()
        }
        

        

    }
    
    func unselectLastWord() {
        if let selectedRange = previousSelectedRange {
            // Get the attributes of the last selected attributed word.
            let currentAttributes = storyText.attributedText.attributesAtIndex(selectedRange.location, effectiveRange: nil)
            // Keep the font attribute.
            let fontAttribute: AnyObject? = currentAttributes[NSFontAttributeName]
            
            // Create a new mutable attributed string using the last selected word.
            let attributedWord = NSMutableAttributedString(string: storyText.attributedText.attributedSubstringFromRange(selectedRange).string)
            
            // Set the previous font attribute, and make the foreground color black.
            attributedWord.addAttribute(NSForegroundColorAttributeName, value: UIColor.blackColor(), range: NSMakeRange(0, attributedWord.length))
            attributedWord.addAttribute(NSFontAttributeName, value: fontAttribute!, range: NSMakeRange(0, attributedWord.length))
            
            // Update the text storage property and replace the last selected word with the new attributed string.
            storyText.textStorage.beginEditing()
            storyText.textStorage.replaceCharactersInRange(selectedRange, withAttributedString: attributedWord)
            storyText.textStorage.endEditing()
        }
    }
    
    
    // same animation function
    func doAnimation() {
        
        
            if counterSadBunny == 14 {
                
                counterSadBunny = 1
                
            } else {
                
                counterSadBunny += 1
                
            }
            
            
            
            storyImage.image = UIImage(named: "sadBunny\(counterSadBunny).tiff")
        

    }
    
    func doAnimation2() {
        
        
        if counterScaredBunny == 4 {
            
            counterScaredBunny = 1
            
        } else {
            
            counterScaredBunny += 1
            
        }
        
        
        
        storyImage.image = UIImage(named: "ScaredBunny\(counterScaredBunny).tiff")
        
        
    }
    
    func doAnimation3() {
        
        
        if counterFrog == 14 {
            
            counterFrog = 1
            
        } else {
            
            counterFrog += 1
            
        }
        
        
        
        storyImage.image = UIImage(named: "frogs\(counterFrog).tiff")
        
        
    }
    
    
    func doAnimation4() {
        
        
        if counterFunBunny == 66 {
            
            counterFunBunny = 1
            
        } else {
            
            counterFunBunny += 1
            
        }
        
        
        
        storyImage.image = UIImage(named: "funBunny\(counterFunBunny).tiff")
        
        
    }
    
    
    func doAnimation5() {
        
        
        if counterRunningBunny == 11 {
            
            counterRunningBunny = 1
            
        } else {
            
            counterRunningBunny += 1
            
        }
        
        
        
        storyImage.image = UIImage(named: "runningBunny\(counterRunningBunny).tiff")
        
        
    }
    
    func doAnimation6() {
        
        
        if counterHappBunny == 11 {
            
            counterHappBunny = 1
            
        } else {
            
            counterHappBunny += 1
            
        }
        
        
        
        storyImage.image = UIImage(named: "happyBunny\(counterHappBunny).tiff")
        
        
    }
    
    
    
    // this function animate the buttons 
    func animateActionButtonAppearance(shouldHideSpeakButton: Bool) {
        var speakButtonAlphaValue: CGFloat = 1.0
        var pauseStopButtonsAlphaValue: CGFloat = 0.0
        
        if shouldHideSpeakButton {
            speakButtonAlphaValue = 0.0
            pauseStopButtonsAlphaValue = 1.0
        }
        
        UIView.animateWithDuration(0.25, animations: { () -> Void in
            self.btnSpeak.alpha = speakButtonAlphaValue
            
            self.btnPause.alpha = pauseStopButtonsAlphaValue
            
            self.btnStop.alpha = pauseStopButtonsAlphaValue
        })
    }
    


}
