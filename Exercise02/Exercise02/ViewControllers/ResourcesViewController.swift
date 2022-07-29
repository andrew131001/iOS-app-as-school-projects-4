//
//  ResourcesViewController.swift
//  Exercise02
//
//  Created by Andrew Ok on 2022-07-27.
//

import UIKit

class ResourcesViewController: UIViewController {
    
    @IBOutlet weak var id: UITextField!
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var duration: UITextField!
    @IBOutlet weak var hourlyRate: UITextField!
    @IBOutlet weak var textview: UITextView!
    
    // initialization
    var employeeID: Int?
    var employeeName: String?
    var employeeDuration: Int = 0
    var employeeHourlyRate: Int = 0
    var projectNameInResources: String?
    var projectDurationInResources: Int?
    var projectHourlyRateInResources: Int?
    var totalCost: Int?
    var totalEarnings: Int?
    
    // duration function
    @IBAction func employeeDurationHours(_ sender: UITextField) {
        // assign user's input to the variable
        employeeDuration = Int(sender.text ?? "") ?? 0
        // check if the input is not exceeded project duration,
        // otherwise pop up alert
        if employeeDuration > projectDurationInResources! {
            // call alert function
            employeeDurationAlert()
        }
    }
    
    // mvoe to workorder vc - continue button
    @IBAction func toWorkOrder(_ sender: Any) {
        self.performSegue(withIdentifier: "toWorkOrder", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "toWorkOrder") {
            // check if there are missing input so that it can pass all data correctly
            if name.text == "" || duration.text == "" {
                generalAlert()
            } else {
                // pass data to each workorder vc variables by clicking continue button
                let workorderVC = segue.destination as! WorkOrderViewController
                workorderVC.projectNameInWorkOrder = projectNameInResources ?? ""
                workorderVC.totalCostInWorkOrder = totalCost ?? 0
                workorderVC.employeeNameInWorkOrder = employeeName ?? ""
                workorderVC.totalEraningsInWorkOrder = totalEarnings ?? 0
            }
        }
    }
    
    // save button
    @IBAction func saveBtn(_ sender: UIButton) {
        // check if there are missing input so that it can pass all data correctly
        if name.text == "" || duration.text == "" {
            generalAlert()
        } else {
            // assign input from name textfield
            employeeName = name.text
            // calculate costs and earnings
            totalCost = (projectHourlyRateInResources ?? 0) * (projectDurationInResources ?? 0)
            totalEarnings = (employeeDuration) * (projectHourlyRateInResources ?? 0)
            // show stored property values
            textview.text = "Project Name: \(projectNameInResources!)\nEmployeeName: \(employeeName!)\nTotal Cost of Hiring: $\(totalCost!)\nTotal Eranings for Employee: $\(totalEarnings!)"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        employeeID = Int.random(in: 100...1000) // random number between 100 and 999
        id.text = "Employee ID: \(String(employeeID!))" // assign random number
        // show hourly rate from project vc
        hourlyRate.text = String(projectHourlyRateInResources ?? 0)
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
    
    // alsert function
    func employeeDurationAlert() {
        // create an alert
        let dialogMessage = UIAlertController(title: "Duration Alert", message: "It cannot exceed project duration (\(projectDurationInResources!)hrs).", preferredStyle: UIAlertController.Style.alert)
        // create OK button with action handler which has user be back to enter new input
        let ok = UIAlertAction(title: "OK", style: .default, handler: {_ in self.duration.becomeFirstResponder()})
        // add OK button to a dialog
        dialogMessage.addAction(ok)
        // present alert to user
        present(dialogMessage, animated: true, completion: nil)
    }
}// end class
