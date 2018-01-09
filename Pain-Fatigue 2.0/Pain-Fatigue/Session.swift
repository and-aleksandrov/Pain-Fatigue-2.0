//
//  Patient.swift
//  Pain&Fatigue
//
//  Created by Andrey Aleksandrov on 12/7/17.
//  Copyright © 2017 Andrey Aleksandrov. All rights reserved.
//

import Foundation
import UIKit

struct Session {
    
    //var session: dictionary
    
    var id: String = ""
    var date: String
    var pain: String  = ""
    var fatigue: String  = ""
    var exerciseID: String  = ""
    var set: String = ""
    
    

    
    init(dictionary: [String: AnyObject]) {
        
        self.id = (dictionary["id"] as? String)!
        self.date = (dictionary["date"] as? String)!
        self.pain = (dictionary["pain"] as? String)!
        self.fatigue = (dictionary["fatigue"] as? String)!
        self.exerciseID = (dictionary["exerciseID"] as? String)!
        // self.set = (dictionary["set"] as? String)!

    }
    
    var dictionary: [String : Any] {
        var d = [String : Any]()
        
        d["date"] = self.date
        d["id"] = self.id
        d["exerciseID"] = self.exerciseID
        d["pain"] = self.pain
        d["fatigue"] = self.fatigue
        // d["set"] = self.set

        return d
    }
    
    
}
