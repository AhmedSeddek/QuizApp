
//  ViewController.swift
//  TrueFalseStarter

import UIKit
import GameKit
import GameplayKit
import AudioToolbox
import AVFoundation
import  SpriteKit

class ViewController: UIViewController {
    
    let questionsPerRound = allQuestions.count
    var questionsAsked = 0
    var correctQuestions = 0
    var indexOfSelectedQuestion: Int = 0
    var previousQuestionsArray: [Int] = []
    var gameSoundTimerEnd: SystemSoundID = 0
    // Lightning Timer Variables
    var lightningTimer = NSTimer()
    var seconds = 15
    var timerRunning = false
    var gameSound: SystemSoundID = 0
   
    @IBOutlet weak var questionField: UILabel!
    @IBOutlet weak var firstAnswerButton: UIButton!
    @IBOutlet weak var secondAnswerButton: UIButton!
    @IBOutlet weak var thirdAnswerButton: UIButton!
    @IBOutlet weak var fourthAnswerButton: UIButton!
    @IBOutlet weak var playAgainButton: UIButton!
    @IBOutlet weak var nextQuestion: UIButton!
    @IBOutlet weak var timerLabel: UILabel!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        openingSound()
        displayQuestion()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //display random questions without repetation
    func displayQuestion() {
        indexOfSelectedQuestion = GKRandomSource.sharedRandom().nextIntWithUpperBound(allQuestions.count)
        // while loop for making sure that questions are not repeated
        while previousQuestionsArray.contains(indexOfSelectedQuestion) {
            indexOfSelectedQuestion = GKRandomSource.sharedRandom().nextIntWithUpperBound(allQuestions.count)
        }
        
        previousQuestionsArray.append(indexOfSelectedQuestion)
        let gameQuestions = allQuestions[indexOfSelectedQuestion]
        questionField.textColor = UIColor(red: 255/255.0, green: 255/255.0, blue: 255/255.0, alpha: 1)
        questionField.text = gameQuestions.question
        playAgainButton.hidden = true
        enableButtons()
        
        // choices for every question
        firstAnswerButton.setTitle(gameQuestions.option1, forState: .Normal)
        secondAnswerButton.setTitle(gameQuestions.option2, forState: .Normal)
        thirdAnswerButton.setTitle(gameQuestions.option3, forState: .Normal)
        fourthAnswerButton.setTitle(gameQuestions.option4, forState: .Normal)
        
        resetTimer()
        beginTimer()
        
    }
    
   //display score
    func displayScore() {
        // Hide the answer buttons
        firstAnswerButton.hidden = true
        secondAnswerButton.hidden = true
        thirdAnswerButton.hidden = true
        fourthAnswerButton.hidden = true
        
        // Display play again button
        playAgainButton.hidden = false
        questionField.textColor = UIColor(red: 255/255.0, green: 255/255.0, blue: 255/255.0, alpha: 1)
        questionField.text = "Way to go!\nYou got \(correctQuestions) out of \(questionsPerRound) correct!"
        timerLabel.hidden = true
    }
    
    //check answers
    @IBAction func checkAnswer(sender: UIButton) {
        
        // Increment the questions asked counter
        questionsAsked += 1
        let selectedQuestionDict = allQuestions[indexOfSelectedQuestion]
        let correctAnswer = selectedQuestionDict.answer
        if ( sender.titleLabel!.text == correctAnswer)
        {
            correctQuestions += 1
            questionField.textColor = UIColor(red: 50/255.0, green: 153/255.0, blue: 50/255.0, alpha: 1)
            questionField.text = "Correct!"
            correctAnswerSound()
            disableButtons()
            lightningTimer.invalidate()
        }
        else
        {
            questionField.textColor = UIColor(red: 204/255.0, green: 40/255.0, blue: 40/255.0, alpha: 1)
            questionField.text = "Sorry, wrong answer! \n\n Correct Answer: \(correctAnswer)"
            wrongAnswerSound()
            disableButtons()
            lightningTimer.invalidate()
        }
      loadNextRoundWithDelay(seconds: 2)
    }
    
    //next round
    func nextRound() {
        if questionsAsked == questionsPerRound {
            // Game is over
            displayScore()
            lightningTimer.invalidate()
            resetTimer()
        } else {
            // Continue game
            displayQuestion()
        }
    }
    
    //play again
    @IBAction func playAgain() {
        // Show the answer buttons
        openingSound()
        firstAnswerButton.hidden = false
        secondAnswerButton.hidden = false
        thirdAnswerButton.hidden = false
        fourthAnswerButton.hidden = false
        timerLabel.hidden = false
        questionsAsked = 0
        correctQuestions = 0
        previousQuestionsArray.removeAll()
        nextRound()
    }
    
    // Lightning Timer Methods
    func beginTimer() {
        if timerRunning == false {
        lightningTimer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: #selector(ViewController.countdownTimer), userInfo: nil, repeats: true)
         timerRunning = true
                }
             }
    
    //countdown timer
    func countdownTimer() {
    let selectedQuestionDict = allQuestions[indexOfSelectedQuestion]
    let correctAnswer = selectedQuestionDict.answer
    // countdown by 1 second
    seconds -= 1
    timerLabel.text = " Sec: \(seconds)"
    if seconds == 0 {
    lightningTimer.invalidate()
    questionsAsked += 1
    questionField.text = "Sorry, time ran out! \n\n Correct Answer: \(correctAnswer)"
    disableButtons()
    loadNextRoundWithDelay(seconds: 2)
            }
    }
    
    //reset timer
    func resetTimer() {
        seconds = 9
        timerLabel.text = " Sec: \(seconds)"
        timerRunning = false
    }
    
    // MARK: Helper Methods
    func loadNextRoundWithDelay(seconds seconds: Int) {
        // Converts a delay in seconds to nanoseconds as signed 64 bit integer
        let delay = Int64(NSEC_PER_SEC * UInt64(seconds))
        // Calculates a time value to execute the method given current time and delay
        let dispatchTime = dispatch_time(DISPATCH_TIME_NOW, delay)
        // Executes the nextRound method at the dispatch time on the main queue
        dispatch_after(dispatchTime, dispatch_get_main_queue()) {
            self.nextRound()
        }
    }
    
    //enable buttons
    func enableButtons() {
        firstAnswerButton.userInteractionEnabled = true
        secondAnswerButton.userInteractionEnabled = true
        thirdAnswerButton.userInteractionEnabled = true
        fourthAnswerButton.userInteractionEnabled = true
    }
    
    //diable buttons
    func disableButtons() {
        firstAnswerButton.userInteractionEnabled = false
        secondAnswerButton.userInteractionEnabled = false
        thirdAnswerButton.userInteractionEnabled = false
        fourthAnswerButton.userInteractionEnabled = false
    }
}

