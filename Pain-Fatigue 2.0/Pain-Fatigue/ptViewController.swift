
import Foundation

import UIKit

class ptViewController: UIViewController {
    
    var session: [Session] = [Session]()
    var mySessions: Record!
    var currentSession : Session!
    var set: Int = 1
    var painNumber: Int = 0
    var fatigueNumber: Int = 0
    
    var numberOfSets: Int = 3
    
    var date: String = ""
    var userID: String! = ""
    
    var exerciseNumber: Int! = 0
    var maxExerciseNumber: Int! = 2
    
    var exercises = ExerciseBank().exercises
    
    
    
    @IBOutlet weak var GIFView: UIImageView!
    
    @IBOutlet weak var Submit: UIButton!
    @IBOutlet weak var painSlider: UISlider!
    @IBOutlet weak var fatigueSlider: UISlider!
    
    @IBOutlet weak var numberReps: UITextView!
    @IBOutlet weak var numberExercise: UITextView!
    
    
    @IBOutlet weak var painLabel: UITextView!
    @IBOutlet weak var fatigueLabel: UITextView!
    @IBOutlet weak var setLabel: UITextView!
    
    @IBOutlet weak var painFieldNumber: UILabel!
    @IBOutlet weak var fatigueFieldNumber: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        self.mySessions = appDelegate.mySessions
        self.userID = appDelegate.userID
        
        if self.userID == nil {
            self.userID = UserDefaults.standard.value(forKey: "UserID") as! String
        }
        
        let exercise: Exercise = exercises[exerciseNumber]
        self.navigationItem.title = exercise.name
        
        GIFView.loadGif(name: exercise.name)
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false;
        
    }
    
    
    @IBAction func Submit(_ sender: Any) {
        
        if exerciseNumber < maxExerciseNumber  {
            
            if set < numberOfSets {
        painNumber = Int(painNumber + Int(painSlider.value))
        fatigueNumber = Int(fatigueNumber + Int(fatigueSlider.value))
            self.date =  Date().description
            set = set + 1
            setLabel.text = "Sets: \(set) of \(numberOfSets)"
            painSlider.value = 0
            fatigueSlider.value = 0
            painFieldNumber.text = "0"
            fatigueFieldNumber.text = "0"
            
            
        } else {
            painNumber = Int((painNumber + Int(painSlider.value)) / set)
            fatigueNumber = Int((fatigueNumber + Int(fatigueSlider.value)) / set)
            
            var dictionary: [String : AnyObject] {
                var d = [String : Any]()
                
                print(self.set)
                
                d["date"] = self.date
                d["id"] = self.userID
                d["exerciseID"] = "1"     // next feature:    self.exercises[exerciseNumber]
                d["pain"] = String(painNumber)
                d["fatigue"] = String(fatigueNumber)
              // next feature:   d["set"] = String(self.set)
                
                
                return d as [String : AnyObject]
            }
            
            // Create a session object from the dictionary
            currentSession = Session(dictionary: dictionary)
            print(currentSession)
            
            // Add current session to the mySession object inside the AppDelegate and save to file
            mySessions.add(currentSession)
            
            // Update set number to starting posotion
            set = 1
            
                if exerciseNumber < maxExerciseNumber - 1  {
                exerciseNumber = exerciseNumber + 1
                
               let  nextExercise = exercises[exerciseNumber]
                self.navigationItem.title = nextExercise.name
                
                GIFView.loadGif(name: nextExercise.name)
                setLabel.text = "Sets: \(set) of \(numberOfSets)"
                painSlider.value = 0
                fatigueSlider.value = 0
                painFieldNumber.text = "0"
                    fatigueFieldNumber.text = "0"
                
            } else {
                // Alert user that the progress was saved
                showAlert()
                
                // Triggger the Segue back to the main View Controller with delay
                let delay = DispatchTime.now() + 1 // number of delay in seconds
                DispatchQueue.main.asyncAfter(deadline: delay) {
                    self.performSegue(withIdentifier: "SubmitSegue", sender: self)
                    
                }
            }
            }
            
            
            } else {
            
        // Alert user that the progress was saved
        showAlert()
    
        // Triggger the Segue back to the main View Controller with delay
        let delay = DispatchTime.now() + 1 // number of delay in seconds
        DispatchQueue.main.asyncAfter(deadline: delay) {
        self.performSegue(withIdentifier: "SubmitSegue", sender: self)

        }
    
    
    }
    }
    
    @IBAction func painSliderChanged(_ sender: UISlider) {
        painFieldNumber.text = String(Int(painSlider.value))
    }
    
    @IBAction func fatigueSliderChanged(_ sender: UISlider) {
        fatigueFieldNumber.text = String(Int(fatigueSlider.value))
    }
    

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SubmitSegue" {
            // ...
        }
    }
    
    // Message alert that work has been saved
    var alert:UIAlertController!
    func showAlert() {
        self.alert = UIAlertController(title: "Thank you!", message: "You progress has been saved!", preferredStyle: UIAlertControllerStyle.alert)
        self.present(self.alert, animated: true, completion: nil)
        Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(ptViewController.dismissAlert), userInfo: nil, repeats: false)
    }
    
    func dismissAlert(){
        // Dismiss the alert from here
        self.alert.dismiss(animated: true, completion: nil)
    }
    
    
    
    
    
}
