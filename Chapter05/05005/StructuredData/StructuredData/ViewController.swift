//
//  ViewController.swift
//  StructuredData
//
//  Created by CoderDream on 2019/7/16.
//  Copyright © 2019 CoderDream. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    func locationToSaveTo() -> URL {
        return FileManager.default.urls(
            for: FileManager.SearchPathDirectory.documentDirectory,
            in: FileManager.SearchPathDomainMask.userDomainMask)
            .last!
            .appendingPathComponent("Data.json")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // BEGIN saving_json
        let informationToSave : [String:Any] = [
            "playerName": "Grabthar",
            "weaponType": "Hammer",
            "hitPoints": 1000,
            "currentQuests": ["save the galaxy", "get home"]
        ]
        
        let url : URL = locationToSaveTo()
        
        let dataToSave : Data
        do {
            dataToSave = try JSONSerialization.data(withJSONObject: informationToSave, options: [])
            
            try dataToSave.write(to: url, options: Data.WritingOptions.atomic)
        } catch let error {
            fatalError("Failed to save to JSON! \(error)")
        }
        
        // END saving_json
        
        // BEGIN loading_json
        // Load the data
        guard let loadedData = try? Data(contentsOf: url) else {
            print("Failed to load the data!")
            return
        }
        
        let loadedInformation: [String: Any]
        do {
            loadedInformation = try JSONSerialization.jsonObject(with: loadedData, options: []) as! [String: Any]
        } catch let error {
            print("Error loading data! \(error)")
            return
        }
        for information in loadedInformation {
            print("information: \(information)")
        }        
        // Do work with loadedInformation
        // END loading_json
        
        // BEGIN validating_objects
        // Checking to see if an object is convertible to JSON
        let dictionaryToCheck = ["canIDoThis": true]
        
        let canBeConverted = JSONSerialization.isValidJSONObject(dictionaryToCheck) // == true
        print("canBeConverted: \(canBeConverted)")
        // END validating_objects
    }


}

