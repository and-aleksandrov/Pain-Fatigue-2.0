//
//  ExerciseBank.swift
//  Pain&Fatigue
//
//  Created by Andrey Aleksandrov on 12/7/17.
//  Copyright © 2017 Andrey Aleksandrov. All rights reserved.
//

import Foundation
import UIKit

class ExerciseBank {
    var exercises = [Exercise]()
    
    init() {
        var e: Exercise
        
        e = Exercise(exerciseID: 1, name: "AnklePumps", gif: "AnklePumps", numberOfSets: 3)
        exercises.append(e)
        
        e = Exercise(exerciseID: 2, name: "Ankle Circles", gif: "Ankle Circles", numberOfSets: 2)
        exercises.append(e)
        
        
    }
    
}
