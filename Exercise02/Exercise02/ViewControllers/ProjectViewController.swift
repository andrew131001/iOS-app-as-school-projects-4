//
//  ProjectViewController.swift
//  Exercise02
//
//  Created by Andrew Ok on 2022-07-27.
//

import UIKit

class ProjectViewController: UIViewController{
    
    @IBOutlet weak var id: UITextField!
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var duration: UITextField!
    @IBOutlet weak var hourlyrate: UITextField!
    
    // initialization
    var projectID: Int?
    var projectName: String?
    var projectDuration: Int = 0
    var projectHourlyRate: Int = 0
    
    // duration hours function
    @IBAction func projectDurationInHours(_ sender: UITextField) {
        // assign value from user's input
        projectDuration = Int(sender.text ?? "") ?? 0
        // check if the input is between 50 and 100, otherwise pop up alert
        if projectDuration < 50 || projectDuration > 100 {
            // call alert function
            durationAlert()
        }
    }
    
    // hourly rate function
    @IBAction func projectHourlyRate(_ sender: UITextField) {
        // assign value from user's input
        projectHourlyRate = Int(sender.text ?? "") ?? 0
        // check if the input is between 30 and 150, otherwise pop up alert
        if projectHourlyRate < 30 || projectHourlyRate > 150 {
            // call alert function
            hourlyRateAlert()
        }
    }
    
    // move to recources vc - next button
    @IBAction func toResources(_ sender: Any) {
        self.performSegue(withIdentifier: "toResources", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "toResources") {
            // check if there are missing input so that it can pass all data correctly
            if name.text == "" || duration.text == "" || hourlyrate.text == "" {
                // call alert function
                generalAlert()
            } else {
                // assign user's input
                projectName = name.text
                // send data to resource's vc by clicking next button
                let resourceVC = segue.destination as! ResourcesViewController
                resourceVC.projectDurationInResources = projectDuration
                resourceVC.projectHourlyRateInResources = projectHourlyRate
                resourceVC.projectNameInResources = projectName
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        projectID = Int.random(in: 100...1000) // random number between 100 and 999
        id.text = "Project ID: \(String(projectID!))" // assign random number

        // look for single or multiple taps
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        // Add gesture recognizer to background view
        view.addGestureRecognizer(tap)
    }
    
    // dismiss keyboard
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    // alert function for missing input
    func generalAlert() {
        // create an alert
        let dialogMessage = UIAlertController(title: "Alert", message: "There are missing inputs.", preferredStyle: UIAlertController.Style.alert)
        // create OK button with action handler which has user be back to enter new input
        let ok = UIAlertAction(title: "OK", style: .default, handler: nil)
        // add OK button to a dialog message
        dialogMessage.addAction(ok)
        //present alert to user
        present(dialogMessage, animated: true, completion: nil)
    }
    
    // alert function for duration
    func durationAlert() {
        // create an alert
        let dialogMessage = UIAlertController(title: "Duration Alert", message: "It has to be between 50 and 100.", preferredStyle: UIAlertController.Style.alert)
        // create OK button with action handler which has user be back to enter new input
        let ok = UIAlertAction(title: "OK", style: .default, handler: { _ in self.duration.becomeFirstResponder()})
        // add OK button to a dialog message
        dialogMessage.addAction(ok)
        //present alert to user
        present(dialogMessage, animated: true, completion: nil)
    }
    
    // alert function for duration
    func hourlyRateAlert() {
        // create an alert
        let dialogMessage = UIAlertController(title: "Hourly Rate Alert", message: "It has to be between 30 and 150.", preferredStyle: UIAlertController.Style.alert)
        // create OK button with action handler which has user be back to enter new input
        let ok = UIAlertAction(title: "OK", style: .default, handler: { _ in self.hourlyrate.becomeFirstResponder()})
        // add OK button to a dialog message
        dialogMessage.addAction(ok)
        //present alert to user
        present(dialogMessage, animated: true, completion: nil)
    }
}// end class
