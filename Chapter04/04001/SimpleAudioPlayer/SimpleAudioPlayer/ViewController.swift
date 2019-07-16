//
//  ViewController.swift
//  SimpleAudioPlayer
//
//  Created by CoderDream on 2019/7/16.
//  Copyright © 2019 CoderDream. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var audioPlayer : AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // BEGIN player_creating
        // BEGIN player_resource
        guard let soundFileURL = Bundle.main.url(forResource: "TestSound",
                                                 withExtension:"wav") else {
                                                    print("URL not found")
                                                    return
        }
        // END player_resource
        
        // BEGIN player_create
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: soundFileURL)
        } catch let error {
            print("Failed to load the sound: \(error)")
        }
        // END player_create
        
        audioPlayer?.prepareToPlay()
        // END player_creating
        
    }
    
    @IBAction func playSound(sender : AnyObject) {
        
        // BEGIN player_play
        audioPlayer?.play()
        // END player_play
        
        /*
         // BEGIN player_pause_stop
         // To pause:
         audioPlayer?.pause()
         // To stop:
         audioPlayer?.stop()
         // END player_pause_stop
         
         // To rewind:
         // BEGIN player_rewind
         audioPlayer.currentTime = 0
         // END player_rewind
         */
    }
    
    @IBAction func pauseSound(sender : AnyObject) {
         // BEGIN player_pause_stop
         // To pause:
         audioPlayer?.pause()
    
    }
    @IBAction func stopSound(sender : AnyObject) {
         // BEGIN player_pause_stop
         // To stop:
         audioPlayer?.stop()
         // END player_pause_stop
    }
    
    @IBAction func rewindSound(sender : AnyObject) {
         // To rewind:
         // BEGIN player_rewind
         audioPlayer?.currentTime = 0
         // END player_rewind
    }
    
    // 0:只播放一次后终止
    // 1： 播放两次后终止
    // -1: 不停的播放下去，直到手动停止
    @IBAction func loopModeChanged(loopSwitch : UISwitch) {
        
        if (loopSwitch.isOn) {
            // BEGIN player_loop
            audioPlayer?.numberOfLoops = -1
            // END player_loop
        } else {
            // BEGIN player_no_loop
            audioPlayer?.numberOfLoops = 0
            // END player_no_loop
        }
        
        /* To loop one time (ie play twice):
         // BEGIN player_loop_once
         audioPlayer?.numberOfLoops = 1
         // END player_loop_once
         */
    }
}

