//
//  ViewController.swift
//  Fading
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
        
        guard let url = Bundle.main.url(forResource: "Beacon_Combat_High",
                                        withExtension:"m4a") else {
                                            print("Failed to find resource")
                                            return
        }
        
        audioPlayer = try? AVAudioPlayer(contentsOf:url)
        
        audioPlayer?.numberOfLoops = -1
        audioPlayer?.volume = 1.0
        
        self.audioPlayer?.play()
    }
    
    // 要实现淡入的效果，只需要将 startVolume 参数设为 0.0， endVolume 参数设为 1.0， 然后调用这个方法
    // 要让效果持续的时间更久，只需增加 overTime 参数的值
    @IBAction func fadeIn(sender : AnyObject) {
        // BEGIN fading_in
        fade(player: audioPlayer!, fromVolume: 0.0, toVolume: 1.0, overTime: 1.0)
        // END fading_in
    }
    
    // 要实现淡出的效果，只需要将 startVolume 参数设为 1.0， endVolume 参数设为 0.0， 然后调用这个方法
    @IBAction func fadeOut(sender : AnyObject) {
        // BEGIN fading_out
        fade(player: audioPlayer!, fromVolume: 1.0, toVolume: 0.0, overTime: 1.0)
        // END fading_out
    }
    
    // BEGIN fading
    func fade(player: AVAudioPlayer,
              fromVolume startVolume : Float,
              toVolume endVolume : Float,
              overTime time : Float) {
        
        // Update the volume every 1/100 of a second
        // 计算音量改变的次数：每秒钟改变音量 100 次，即 n 秒钟改变 n * 100 次
        let fadeSteps : Int = Int(time) * 100
        // Work out how much time each step will take
        // 每次改变需要的时间为： 1/100 秒
        let timePerStep : Double = 1 / 100.0
        // 设置当前音量为开始音量
        self.audioPlayer?.volume = startVolume        
        // Schedule a number of volume changes
        // 根据计算出的次数进行循环
        for step in 0...fadeSteps {
            
            let delayInSeconds : Double = Double(step) * timePerStep
            
            let deadline = DispatchTime.now() + delayInSeconds
            
            DispatchQueue.main.asyncAfter(deadline: deadline, execute: {
                let fraction = (Float(step) / Float(fadeSteps))
                
                player.volume = startVolume + (endVolume - startVolume) * fraction
            })
            
        }
    }
    // END fading    
}

