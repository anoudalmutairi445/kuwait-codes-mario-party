//
//  playerdetailsViewController.swift
//  MarioParty
//
//  Created by ❦𝔸❦ 𝕄 on 7/2/20.
//  Copyright © 2020 Dalal Alhazeem. All rights reserved.
//

import UIKit
import AVFoundation

class playerdetailsViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var imgView1: UIImageView!
    @IBOutlet weak var starsImg: UIImageView!
    
    @IBOutlet weak var backgroundImage: UIImageView!
    var playerSoundEffect: AVAudioPlayer?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = selectedPlayer.name
        imgView1.loadGif(name: selectedPlayer.name) 
        backgroundImage.image = UIImage(named: selectedPlayer.bgName())
        


        // Do any additional setup after loading the view.
    }
    
    @IBAction func randomStars(_ sender: Any) {
        var stars = ["Star1", "Star2", "Star3", "Star4", "Star5"]
        let randomStar = stars.randomElement()!
        starsImg.image = UIImage(named: randomStar)
    }
    @IBAction func backgroundMusicBtn(_ sender: Any) {
        
        playMusic(musicName: selectedPlayer.musicName())
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
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
