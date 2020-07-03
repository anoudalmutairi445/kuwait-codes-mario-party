//
//  ViewController.swift
//  MarioParty
//
//  Created by Dalal Alhazeem on 3/24/20.
//  Copyright © 2020 Dalal Alhazeem. All rights reserved.
//

import UIKit
import AVFoundation

var selectedPlayer = Player(name: "Mario")



class ViewController: UIViewController {
    
    
    
    var playerSoundEffect: AVAudioPlayer?
    var background: AVAudioPlayer?

   
    @IBOutlet weak var playerImg: UIImageView!
    
    func playBackgroundMusic(musicName: String){
           let path = Bundle.main.path(forResource: musicName, ofType:nil)!
           let url = URL(fileURLWithPath: path)

           do {
               background = try AVAudioPlayer(contentsOf: url)
               background?.play()
           } catch {
               // couldn't load file :(
           }
       }
    
    func playMusic(musicName: String){
        let path = Bundle.main.path(forResource: musicName, ofType:nil)!
        let url = URL(fileURLWithPath: path)

        do {
            playerSoundEffect = try AVAudioPlayer(contentsOf: url)
            playerSoundEffect?.play()
        } catch {
            // couldn't load file :(
        }
    }
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view.
        //nextButton.isUserInteractionEnabled = false
        playBackgroundMusic(musicName: "BG.wav")
    }
    
    

    @IBAction func randomPlayer(_ sender: Any) {
        let randomPlayer = players.randomElement()!
        playerImg.loadGif(name: randomPlayer.name)
        playMusic(musicName: randomPlayer.musicName())
        selectedPlayer = randomPlayer
        
        
    }
    
}

