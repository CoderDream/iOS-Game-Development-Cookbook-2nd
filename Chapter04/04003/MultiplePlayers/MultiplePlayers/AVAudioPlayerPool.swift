//
//  AVAudioPlayerPool.swift
//  MultiplePlayers
//
//  Created by CoderDream on 2019/7/16.
//  Copyright © 2019 CoderDream. All rights reserved.
//
import UIKit
import AVFoundation

// BEGIN pool
// An array of all players stored in the pool; not accessible outside this file
// 一个数组，存放所有可重用的 AVAudioPlayer 对象；私有，外部不可见
private var players : [AVAudioPlayer] = []

class AVAudioPlayerPool: NSObject {
    
    // Given the URL of a sound file, either create or reuse an audio player
    // 指定一个声音文件的URL，要么会创建一个新的 AVAudioPlayer
    class func player(url : URL) -> AVAudioPlayer? {
        
        // Try and find a player that can be reused and is not playing
        // 查找一个空闲的 AVAudioPlayer
        let availablePlayers = players.filter { (player) -> Bool in
            return player.isPlaying == false && player.url == url
        }
        
        // If we found one, return it
        // 如果找到，返回该对象
        if let playerToUse = availablePlayers.first {
            print("Reusing player for \(url.lastPathComponent)")
            return playerToUse
        }
        
        // Didn't find one? Create a new one
        // 如果没有找到，创建一个新的对象
        do {
            let newPlayer = try AVAudioPlayer(contentsOf: url)
            players.append(newPlayer)
            return newPlayer
        } catch let error {
            print("Couldn't load \(url.lastPathComponent): \(error)")
            return nil
        }
    }
}
// END pool
