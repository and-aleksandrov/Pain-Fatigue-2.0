//
//  Record.swift
//  Pain&Fatigue
//
//  Created by Andrey Aleksandrov on 12/7/17.
//  Copyright © 2017 Andrey Aleksandrov. All rights reserved.
//

import Foundation
import UIKit

class Record {
    var name: String
    var sessions: [Session]
    
    init(_ name: String) {
        self.name = name
        self.sessions = []
        
        // Read some data
        if let data = try? Data(contentsOf: fileURL) {
            
            //Make a JSON object [[String: Any]]
            let dictionaries = try! JSONSerialization.jsonObject(with: data) as! [[String: Any]]
            // for each dictionary, add a session
            for d in dictionaries{
                sessions.append(Session(dictionary: d as [String : AnyObject]))
            }
        }
    }
    
    func add(_ s: Session) {
        sessions.append(s)
         persist()
    }
    
    func contains(_ s: Session) -> Bool {
        return sessions.contains(where: {$0.id == s.id})
    }

    func persist() {
        // make a json object from session
        var dictionaries = [[String: Any]]()
        
        for s in self.sessions {
            dictionaries.append(s.dictionary)
        }
        
        // make data for the json object
        let data = try! JSONSerialization.data(withJSONObject: dictionaries)
        
        //save datat to the file url
        try! data.write (to: self.fileURL)
        print(fileURL)
    }
    
    private var fileURL: URL {
        let documentDirectory = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor:nil, create:false)
        
        return documentDirectory.appendingPathComponent(name)
    }

}
