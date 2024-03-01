//
//  ViewController.swift
//  SimonSays
//
//  Created by Paweł Jan Tłusty on 01/03/2024.
//

import UIKit
import AVFoundation


class ViewController: UIViewController,AVAudioPlayerDelegate {
    @IBOutlet weak var LevelLabel: UILabel!
    @IBOutlet var soundBTN: [UIButton]!
    @IBOutlet weak var startBTN: UIButton!
    
    var sound1Player:AVAudioPlayer!
    var sound2Player:AVAudioPlayer!
    var sound3Player:AVAudioPlayer!
    var sound4Player:AVAudioPlayer!
    
    var playList = [Int]()
    var currentItem = 0
    var numberOfTaps = 0
    var readyForUser = false
    
    var level = 1
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAudioFiles()
        
    }
    


    func setupAudioFiles() {
        for i in 1...4 {
            guard let soundFilePath = Bundle.main.path(forResource: "\(i)", ofType: "wav"),
                  let soundFileURL = URL(string: soundFilePath) else {
                print("Error loading file \(i).wav")
                continue
            }
            
            do {
                let player = try AVAudioPlayer(contentsOf: soundFileURL)
                player.delegate = self
                player.prepareToPlay() // Preloads audio data to reduce lag on first play.
                
                switch i {
                case 1:
                    sound1Player = player
                case 2:
                    sound2Player = player
                case 3:
                    sound3Player = player
                case 4:
                    sound4Player = player
                default:
                    break
                }
            } catch {
                print("Unable to initialize player for file \(i).wav: \(error)")
            }
        }
    }


    
    
    @IBAction func soundBTNPressed(_ sender: Any) {
        
        let button = sender as! UIButton
        if readyForUser{
            
            switch button.tag {
            case 1:
                highlightBTNWithTag(tag: 1)
                sound1Player.play()
                checkIfCorrect(buttonPressed: 1)
//                resetBTNHighlights()
                break
            case 2:
                highlightBTNWithTag(tag: 2)
                sound2Player.play()
                checkIfCorrect(buttonPressed: 2)
                break
            case 3:
                highlightBTNWithTag(tag: 3)
                sound3Player.play()
                checkIfCorrect(buttonPressed: 3)
                break
            case 4:
                highlightBTNWithTag(tag: 4)
                sound4Player.play()
                checkIfCorrect(buttonPressed: 4)
                break
            default:
                break
                
            }
        }
    }
    
    func isCorrect(buttonPressed:Int) -> Bool {
         return buttonPressed == playList[numberOfTaps]
    }
    
    func checkIfCorrect(buttonPressed:Int){
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                self.resetBTNHighlights()
        }
        if isCorrect(buttonPressed: buttonPressed){
            if numberOfTaps == playList.count - 1{
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                    self.nextRound()
//                    self.resetBTNHighlights()
                }
                return
            }
            numberOfTaps += 1
        }
        else
        {
            resetGame()
        }
            
    }
    
    
    
    @IBAction func startGame(_ sender: Any) {
        let randomNumber = Int(arc4random_uniform(4) + 1)
        playList.append(randomNumber)
        disableButtons()
        
        LevelLabel.text = "Level 1"
        startBTN.isHidden = true
        playNextItem()
    }
    
    func resetGame()  {
        readyForUser = false
        disableButtons()
        level = 1
        numberOfTaps = 0
        currentItem = 0
        playList = []
        LevelLabel.text = "GAME OVER"
        startBTN.isHidden = false
        startBTN.isEnabled = true
    }
    
    func nextRound() {
        disableButtons()
        level += 1
        LevelLabel.text = "Level \(level)"
        readyForUser = false
        numberOfTaps = 0
        currentItem = 0
        
        let randomNumber = Int(arc4random_uniform(4) + 1)
        playList.append(randomNumber)
        playNextItem()
    }
    
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        if currentItem <= playList.count - 1 {
            playNextItem()
        }
        else{
            readyForUser = true
            resetBTNHighlights()
            enableButtons()
        }
    }
    
    func playNextItem (){
        let selectedItem = playList[currentItem]
        
        switch selectedItem{
        case 1:
            highlightBTNWithTag(tag: 1)
            sound1Player.play()
            break
        case 2:
            highlightBTNWithTag(tag: 2)
            sound2Player.play()
            break
        case 3:
            highlightBTNWithTag(tag: 3)
            sound3Player.play()
            break
        case 4:
            highlightBTNWithTag(tag: 4)
            sound4Player.play()
            break
            
        default:
            break
        }
        currentItem += 1
    }
    
    func highlightBTNWithTag (tag:Int){
        resetBTNHighlights()
        switch tag {
        case 1:
            soundBTN[tag - 1].setImage(UIImage(named: "redPressed"), for: [])
            break
        case 2:
            soundBTN[tag - 1].setImage(UIImage(named: "yellowPressed"), for: [])
            break
        case 3:
            soundBTN[tag - 1].setImage(UIImage(named: "bluePressed"), for: [])
            break
        case 4:
            soundBTN[tag - 1].setImage(UIImage(named: "greenPressed"), for: [])
            break
        default:
            break
        }
    }
    
    func resetBTNHighlights (){
        soundBTN[0].setImage(UIImage(named: "red"), for: [])
        soundBTN[1].setImage(UIImage(named: "yellow"), for: [])
        soundBTN[2].setImage(UIImage(named: "blue"), for: [])
        soundBTN[3].setImage(UIImage(named: "green"), for: [])
    }

    
    func disableButtons (){
        for btn in soundBTN {
            btn.isEnabled = false
        }
    }
    
    func enableButtons (){
        for btn in soundBTN {
            btn.isEnabled = true
        }
    }
}
