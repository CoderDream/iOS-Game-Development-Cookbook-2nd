//
//  ViewController.swift
//  SavingState
//
//  Created by CoderDream on 2019/7/16.
//  Copyright © 2019 CoderDream. All rights reserved.
//

import UIKit

// The list of achievements that the player can get.
enum Achievements : String, Codable {
    case startedPlaying
    case finishedGameInTenMinutes
    case foundAllSecretRooms
}

// The data that represents a saved game.
class SavedGame : Codable {
    var levelNumber = 0
    var playerName = ""
    var achievements: Set<Achievements> = []
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func saveMonster(sender : AnyObject) {
        
        // Encoding data
        // BEGIN encode
        let monster = Monster()
        monster.name = "Big Bear"
        var data = Data()
        do {
            // Encode the data
            let encoder = JSONEncoder()
            data = try encoder.encode(monster)
            // We can now write the data to disk
            print(String(data: data, encoding: .utf8)!)
        } catch let error {
            print("Failed to encode the saved monster! \(error)")
        }
        
        var decodedMonster: Monster?
        do {
            let decoder = JSONDecoder()
            decodedMonster = try decoder.decode(Monster.self, from: data)
        } catch let error {
            print("Failed to decode the saved monster! \(error)")
        }
        // 'decodedSavedGame' will now be either nil or contain a SavedGame object
        print("\(String(describing: decodedMonster?.name))") // = "Grabthar"
    }
    
    @IBAction func saveGame(sender : AnyObject) {
        let savedGame = SavedGame()
        // Store some data
        savedGame.levelNumber = 3
        savedGame.playerName = "Grabthar"
        savedGame.achievements.insert(Achievements.foundAllSecretRooms)
        var data = Data()
        do {
            // Encode the data
            let encoder = JSONEncoder()
            data = try encoder.encode(savedGame)
            // We can now write the data to disk
            print(String(data: data, encoding: .utf8)!)
        } catch let error {
            print("Failed to encode the saved game! \(error)")
        }
        
        var decodedSavedGame: SavedGame?
        do {
            let decoder = JSONDecoder()
            decodedSavedGame = try decoder.decode(SavedGame.self, from: data)
        } catch let error {
            print("Failed to decode the saved game! \(error)")
        }
        // 'decodedSavedGame' will now be either nil or contain a SavedGame object
        print("\(String(describing: decodedSavedGame?.playerName))") // = "Grabthar"
    }
}
