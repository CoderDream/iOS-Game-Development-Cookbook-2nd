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
    var achievements : Set<Achievements> = []
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // Encoding data
        // BEGIN encode
        let monster = Monster()
        // 'archivedData(withRootObject:)' was deprecated in iOS 12.0: Use +archivedDataWithRootObject:requiringSecureCoding:error: instead
        //let monsterData = NSKeyedArchiver.archivedData(withRootObject: monster)
        
        //let monsterData2 = NSKeyedArchiver.archivedData(withRootObject: monster)
        //monsterData = NSKeyedArchiver.archivedDataWithRootObject(monster, requiringSecureCoding: YES, error: nil)
        // monsterData can now be saved to disk
        // END encode
        var monsterData: Data = Data()
        do {
             monsterData = try NSKeyedArchiver.archivedData(withRootObject: monster, requiringSecureCoding: false)
            //try isSuccessfulSave.write(to: Meal.ArchiveURL)
            //os_log("Meals successfully saved", log: OSLog.default, type: .debug)
        } catch {
            //os_log("Failed to save meals...", log: OSLog.default, type: .error)
        }
        
        // Decoding data
        // BEGIN decode
        // Load monsterData (an NSData) from somewhere, and then:
        // 'unarchiveObject(with:)' was deprecated in iOS 12.0: Use +unarchivedObjectOfClass:fromData:error: instead
        let loadedMonster = NSKeyedUnarchiver.unarchiveObject(with: monsterData) as! Monster
        
       // let loadedMonster = NSKeyedUnarchiver.unarchivedObject(ofClasses: [Monster], from: monsterData)
        // END decode
        
        let savedGame = SavedGame()
        // Store some data
        savedGame.levelNumber = 3
        savedGame.playerName = "Grabthar"
        savedGame.achievements.insert(Achievements.foundAllSecretRooms)
        
        do {
            // Encode the data
            let encoder = JSONEncoder()
            let data = try encoder.encode(savedGame)
            // We can now write the data to disk
            print(String(data: data, encoding: .utf8)!)
        } catch let error {
            print("Failed to encode the saved game! \(error)")
        }
    }


}

