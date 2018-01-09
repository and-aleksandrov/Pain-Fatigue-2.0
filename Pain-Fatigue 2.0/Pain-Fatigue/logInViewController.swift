//
//  logInViewController.swift
//  Pain&Fatigue
//
//  Created by Andrey Aleksandrov on 12/11/17.
//  Copyright © 2017 Andrey Aleksandrov. All rights reserved.
//

import Foundation


import UIKit

class logInViewController: UIViewController {
    var userID: String? = ""
    
    @IBOutlet weak var codeField: UITextField!
    
    @IBOutlet weak var logInButton: UIButton!
    
   @IBOutlet weak var cancelButton: UIButton!
    
    @IBOutlet weak var enterLabel: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func logInFunction(_ sender: Any) {
        self.userID = codeField.text!
        UserDefaults.standard.set(true, forKey: "hasLoggedIn")
        UserDefaults.standard.set(self.userID, forKey: "UserID")
        //let appDelegate = UIApplication.shared.delegate as! AppDelegate
        //appDelegate.userID! = self.userID!
        self.dismiss(animated: true, completion: nil)
    }
    
    
}
