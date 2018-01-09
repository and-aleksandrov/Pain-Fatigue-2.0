

import Foundation


import UIKit

class progressViewController: UITableViewController {
    
    var mySessions: Record!
    var userID: String! = ""
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        self.mySessions = appDelegate.mySessions
        self.userID = appDelegate.userID

    }
    

    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false;
       // super.viewWillAppear(animated)
       // tableView.reloadData()
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mySessions.sessions.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let session = mySessions.sessions[indexPath.row]
        
        let str = session.date as NSString

        let mystring = str.substring(to:10)
        cell.textLabel?.text = "\(mystring)                    Pain: \(session.pain)   Fatigue: \(session.fatigue)  "
  
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
      
    }
    
    
}
