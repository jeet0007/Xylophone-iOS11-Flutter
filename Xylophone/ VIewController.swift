//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 27/01/2016.
//  Copyright © 2016 London App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController ,AVAudioPlayerDelegate{
    
    var player: AVAudioPlayer?

    override func viewDidLoad() {
        super.viewDidLoad()
    }



    @IBAction func notePressed(_ sender: UIButton) {
        playSound(String(sender.tag))
    }
    
    
    func playSound(_ tag:String){
        guard let url = Bundle.main.url(forResource: "note" + String(tag), withExtension: "wav") else { return }
               do {
                   try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
                   try AVAudioSession.sharedInstance().setActive(true)
                   
                   player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.wav.rawValue)

                   guard let player = player else { return }
                   player.prepareToPlay();
                   player.play()

                   } catch let error {
                       print(error.localizedDescription)
                   }
    }
    
    
  

}

