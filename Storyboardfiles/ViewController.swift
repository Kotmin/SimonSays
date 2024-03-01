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
    let currentItem = 0
    let numberOfTaps = 0
    let readyForUser = false
    
    let level = 1
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAudioFiles()
        
    }
    
    
//    func setupAudioFiles() {
//        if let soundFilePath = Bundle.main.path(forResource: "1", ofType: "wav") {
//            let soundFileURL = URL(fileURLWithPath: soundFilePath)
//            
//            do {
//                sound1Player = try AVAudioPlayer(contentsOf: soundFileURL)
//                // Repeat this process for sound2Player, sound3Player, and sound4Player with their respective files
//            } catch {
//                print("Unable to initialize player: \(error)")
//            }
//            
//        }
//        
//        if let soundFilePath = Bundle.main.path(forResource: "2", ofType: "wav") {
//            let soundFileURL = URL(fileURLWithPath: soundFilePath)
//            
//            do {
//                sound2Player = try AVAudioPlayer(contentsOf: soundFileURL)
//                // Repeat this process for sound2Player, sound3Player, and sound4Player with their respective files
//            } catch {
//                print("Unable to initialize player: \(error)")
//            }
//            
//        }
//        
//        if let soundFilePath = Bundle.main.path(forResource: "3", ofType: "wav") {
//            let soundFileURL = URL(fileURLWithPath: soundFilePath)
//            
//            do {
//                sound3Player = try AVAudioPlayer(contentsOf: soundFileURL)
//                // Repeat this process for sound2Player, sound3Player, and sound4Player with their respective files
//            } catch {
//                print("Unable to initialize player: \(error)")
//            }
//            
//        }
//        
//        if let soundFilePath = Bundle.main.path(forResource: "4", ofType: "wav") {
//            let soundFileURL = URL(fileURLWithPath: soundFilePath)
//            
//            do {
//                sound4Player = try AVAudioPlayer(contentsOf: soundFileURL)
//                // Repeat this process for sound2Player, sound3Player, and sound4Player with their respective files
//            } catch {
//                print("Unable to initialize player: \(error)")
//            }
//            
//        }
//        
//        
//        sound1Player.delegate = self
//        sound1Player.numberOfLoops = 0
//
//        sound2Player.delegate = self
//        sound2Player.numberOfLoops = 0
//        
//        sound3Player.delegate = self
//        sound3Player.numberOfLoops = 0
//        
//        sound4Player.delegate = self
//        sound4Player.numberOfLoops = 0
//    }

    
//    func setupAudioFiles (){
//        let soundFilePath = NSBundle.mainBundle().pathForResouce("1",ofType:"wav")
//        let soundFileURL = NSURL(fileURLWithPath: soundFilePath!)
//    }
    
//    func setupAudioFiles() {
//        if let soundFilePath = Bundle.main.path(forResource: "1", ofType: "wav") {
//            let soundFileURL = URL(fileURLWithPath: soundFilePath)
//        }
//        if let soundFilePath = Bundle.main.path(forResource: "1", ofType: "wav") {
//            let soundFileURL = URL(fileURLWithPath: soundFilePath)
//        }
//                
//        if let soundFilePath = Bundle.main.path(forResource: "1", ofType: "wav") {
//            let soundFileURL = URL(fileURLWithPath: soundFilePath)
//        }
//        if let soundFilePath = Bundle.main.path(forResource: "1", ofType: "wav") {
//            let soundFileURL = URL(fileURLWithPath: soundFilePath)
//        }
//            
//            
//            do {
//                sound1Player = try AVAudioPlayer(contentsOf: soundFileURL)
//                sound1Player.delegate = self
//                sound1Player.numberOfLoops = 0
//                
//                sound2Player = try AVAudioPlayer(contentsOf: soundFileURL)
//                sound2Player.delegate = self
//                sound2Player.numberOfLoops = 0
//                
//                sound3Player = try AVAudioPlayer(contentsOf: soundFileURL)
//                sound3Player.delegate = self
//                sound3Player.numberOfLoops = 0
//                
//                
//                sound4Player = try AVAudioPlayer(contentsOf: soundFileURL)
//                sound4Player.delegate = self
//                sound4Player.numberOfLoops = 0
//                
//
//            } catch {
//                print("Unable to initialize player: \(error)")
//            }
//        }
//    }

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
        
        switch button.tag {
        case 1:
            sound1Player.play()
            print("Wdqwd")
            break
        case 2:
            sound2Player.play()
            break
        case 3:
            sound3Player.play()
            break
        case 4:
            sound4Player.play()
            break
        default:
            break
            
        }
    }
    
    

}
