//
//  ViewController.swift
//  StoringDataLocally
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
        
        let fileManager = FileManager.default
        guard let documentsURL = fileManager.urls(
            for: FileManager.SearchPathDirectory.documentDirectory,
            in:FileManager.SearchPathDomainMask.userDomainMask).last else {
                fatalError("Failed to find the documents folder!")
        }
        let savedGameURL = documentsURL
            .appendingPathComponent("SavedGame.json")
        
        // finally, write out the data to this location:
        do {
            try data.write(to: savedGameURL)
        } catch let error {
            print("Error writing: \(error)")
        }
        
        // You can load the data from disk by reading from the location:
        var loadedData: Data?
        do {
            loadedData = try Data(contentsOf: savedGameURL)
        } catch let error {
            print("Error reading: \(error)")
        }
        
        var decodedSavedGame: SavedGame?
        do {
            let decoder = JSONDecoder()
            decodedSavedGame = try decoder.decode(SavedGame.self, from: loadedData!)
        } catch let error {
            print("Failed to decode the saved game! \(error)")
        }
        // 'decodedSavedGame' will now be either nil or contain a SavedGame object
        print("\(String(describing: decodedSavedGame?.playerName))") // = "Grabthar"
        
    }


}

