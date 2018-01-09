
import UIKit

class mainViewController: UIViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()
       // let appDelegate = UIApplication.shared.delegate as! AppDelegate
                 print("sucess")
    }

    func reloaduser() {
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true;
    }

    override func viewDidAppear(_ animated: Bool) {
        let hasLoggedIn: Bool? = UserDefaults.standard.bool(forKey: "hasLoggedIn")

        if hasLoggedIn == false {
        self.performSegue(withIdentifier: "logInSegue", sender: self)
 
        }
    }

    
}


