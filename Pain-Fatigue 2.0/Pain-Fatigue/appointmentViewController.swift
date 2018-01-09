

import Foundation
import UIKit
import SafariServices

class appointmentViewController: UIViewController {
    
    @IBOutlet weak var cancelButton: UIButton!
    
    @IBOutlet weak var scheduleButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true;
    }
    
    
    @IBAction func cancelPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func scheduleNow(_ sender: Any) {
        let webSite = SFSafariViewController(url: URL(string: "https://www.boomtherapy.com/book-an-appointment/")!)
        self.present(webSite, animated: true, completion: nil)
    }
    
}
