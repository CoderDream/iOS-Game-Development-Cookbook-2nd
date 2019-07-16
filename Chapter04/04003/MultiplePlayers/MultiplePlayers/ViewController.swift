//
//  ViewController.swift
//  MultiplePlayers
//
//  Created by CoderDream on 2019/7/16.
//  Copyright © 2019 CoderDream. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func playSound1(sender : AnyObject) {
        
        // BEGIN multipleplayers_usage
        if let url = Bundle.main.url(forResource: "TestSound",
                                     withExtension: "wav") {
            let player = AVAudioPlayerPool.player(url: url)
            player?.play()
        }
        // END multipleplayers_usage
        
    }
    
    @IBAction func playSound2(sender : AnyObject) {
        if let url = Bundle.main.url(forResource: "ReceiveMessage", withExtension: "aif") {
            let player = AVAudioPlayerPool.player(url: url)
            player?.play()
        }
    }
    
    @IBAction func playSound3(sender : AnyObject) {
        if let url = Bundle.main.url(forResource: "SendMessage", withExtension: "aif") {
            let player = AVAudioPlayerPool.player(url: url)
            player?.play()
        }
    }


}

