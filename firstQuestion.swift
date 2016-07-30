//
//  firstQuestion.swift
//  TrueFalseStarter
//
//  Created by ahmed seddek on 7/26/16.
//  Copyright © 2016 Treehouse. All rights reserved.
//

import UIKit
import GameKit
import AudioToolbox
import AVFoundation

class firstQuestion: UIViewController
{
    /*@IBOutlet weak var questionField: UILabel!
    @IBOutlet weak var firstAnswerButton: UIButton!
    @IBOutlet weak var secondAnswerButton: UIButton!
    @IBOutlet weak var thirdAnswerButton: UIButton!
    @IBOutlet weak var fourthAnswerButton: UIButton!
    @IBOutlet weak var playAgainButton: UIButton!*/
    
let firstQuesAnswers: [String] = ["George Washington","Franklin D.Roosevelt","Woodrow Wilson","Andrew Jackson"]
    
    
    
    func displayAnswer1(firstAnswerButton: AnyObject ,secondAnswerButton: AnyObject ,thirdAnswerButton: AnyObject,fourthAnswerButton: AnyObject ) {
        
        firstAnswerButton.setTitle(firstQuesAnswers[0], forState: .Normal)
        secondAnswerButton.setTitle(firstQuesAnswers[1], forState: .Normal)
        thirdAnswerButton.setTitle(firstQuesAnswers[2], forState: .Normal)
        fourthAnswerButton.setTitle(firstQuesAnswers[3], forState: .Normal)
        
        
    }
}

class secondQuestion: UIViewController
{
    @IBOutlet weak var questionField: UILabel!
    @IBOutlet weak var firstAnswerButton: UIButton!
    @IBOutlet weak var secondAnswerButton: UIButton!
    @IBOutlet weak var thirdAnswerButton: UIButton!
    @IBOutlet weak var fourthAnswerButton: UIButton!
    @IBOutlet weak var playAgainButton: UIButton!
    
    
    let secondQuesAnswers: [String] = ["Nigeria","Russia","Iran","Vietnam"]
 
    func displayAnswer2() {
        
        firstAnswerButton.setTitle(secondQuesAnswers[0], forState: .Normal)
        secondAnswerButton.setTitle(secondQuesAnswers[1], forState: .Normal)
        thirdAnswerButton.setTitle(secondQuesAnswers[3], forState: .Normal)
        fourthAnswerButton.setTitle(secondQuesAnswers[3], forState: .Normal)
        
        playAgainButton.hidden = true
    }
}