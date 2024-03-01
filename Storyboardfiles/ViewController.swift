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
