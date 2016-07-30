import UIKit
import GameKit
import AudioToolbox

class GameScene: SKScene {
    
    var gameSound: SystemSoundID = 0    
    func loadGameStartSound() {
        let pathToSoundFile = NSBundle.mainBundle().pathForResource("tada", ofType: "wav")
        let soundURL = NSURL(fileURLWithPath: pathToSoundFile!)
        AudioServicesCreateSystemSoundID(soundURL, &gameSound)
    }
    
    func playGameStartSound() {
        AudioServicesPlaySystemSound(gameSound)
    }
    
}