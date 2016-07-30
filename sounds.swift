//
//  sounds.swift
//  TrueFalseStarter
//
//  Created by ahmed seddek on 7/26/16.
//  Copyright © 2016 Treehouse. All rights reserved.
//

import UIKit
import AVFoundation

var audioPlayer1 = AVAudioPlayer()
var audioPlayer2 = AVAudioPlayer()
var audioPlayer3 = AVAudioPlayer()


func correctAnswerSound() {
    let pathToSoundFile = NSBundle.mainBundle().pathForResource("tada", ofType: "wav")
    if let pathToSoundFile = pathToSoundFile
    {
        let soundURL = NSURL(fileURLWithPath: pathToSoundFile)
        do {
        try audioPlayer1 = AVAudioPlayer(contentsOfURL: soundURL)
         audioPlayer1.play()
        }
        catch {
        print("")
        }
    }
}

func openingSound() {
    let pathToSoundFile = NSBundle.mainBundle().pathForResource("Speech On", ofType: "wav")
    if let pathToSoundFile = pathToSoundFile
    {
        let soundURL = NSURL(fileURLWithPath: pathToSoundFile)
        do {
            try audioPlayer3 = AVAudioPlayer(contentsOfURL: soundURL)
            audioPlayer3.play()
        }
        catch {
            print("")
        }
    }
}

func wrongAnswerSound() {
    let pathToSoundFile = NSBundle.mainBundle().pathForResource("GameSound", ofType: "wav")
    if let pathToSoundFile = pathToSoundFile
    {
        let soundURL = NSURL(fileURLWithPath: pathToSoundFile)
        do {
            try audioPlayer2 = AVAudioPlayer(contentsOfURL: soundURL)
            audioPlayer2.play()
        }
        catch {
            print("")
        }
    }
}