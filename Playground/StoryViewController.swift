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
        
        speechSynthesizer.delegate = self

        setInitialFontAttribute()

        pvSpeechProgress.alpha = 0.0
        pvSpeechProgress.progress = 0.0
        // Do any additional setup after loading the view.
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

// MAIN STORYBOARD
    
    @IBOutlet weak var storyImage: UIImageView!
    
    @IBOutlet weak var storyText: UITextView!

    @IBOutlet weak var pvSpeechProgress: UIProgressView!
    
    @IBAction func speak(sender: AnyObject) {
        if !speechSynthesizer.speaking {
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
        let speechUtterance = AVSpeechUtterance(string: storyText.text)
        

        
        
        speechSynthesizer.speakUtterance(speechUtterance)
    }
    
    
// VARIABLES

    let speechSynthesizer = AVSpeechSynthesizer()
    
    var totalUtterances: Int! = 0
    
    var currentUtterance: Int! = 0
    
    var totalTextLength: Int = 0
    
    var spokenTextLengths: Int = 0
    
    var previousSelectedRange: NSRange!


// FUNCTIONS
    func setInitialFontAttribute() {
        let rangeOfWholeText = NSMakeRange(0, storyText.text.utf16.count)
        let attributedText = NSMutableAttributedString(string: storyText.text)
        attributedText.addAttribute(NSFontAttributeName, value: UIFont(name: "Arial", size: 18.0)!, range: rangeOfWholeText)
        storyText.textStorage.beginEditing()
        storyText.textStorage.replaceCharactersInRange(rangeOfWholeText, withAttributedString: attributedText)
        storyText.textStorage.endEditing()
    }
    
    

    func speechSynthesizer(synthesizer: AVSpeechSynthesizer, didFinishSpeechUtterance utterance: AVSpeechUtterance) {
        spokenTextLengths = spokenTextLengths + utterance.speechString.utf16.count + 1
        
        let progress: Float = Float(spokenTextLengths * 100 / totalTextLength)
        pvSpeechProgress.progress = progress / 100
        
        if currentUtterance == totalUtterances {
            
                
            unselectLastWord()
            previousSelectedRange = nil
        }

    }
    
    
    func speechSynthesizer(synthesizer: AVSpeechSynthesizer, didStartSpeechUtterance utterance: AVSpeechUtterance) {
        currentUtterance = currentUtterance + 1

    }
    
    
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
}
