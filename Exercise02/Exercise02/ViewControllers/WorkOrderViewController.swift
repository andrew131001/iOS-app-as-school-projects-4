//
//  WorkOrderViewController.swift
//  Exercise02
//
//  Created by Andrew Ok on 2022-07-27.
//

import UIKit

class WorkOrderViewController: UIViewController {
    
    @IBOutlet weak var projectName: UITextField!
    @IBOutlet weak var totalCost: UITextField!
    @IBOutlet weak var employeeName: UITextField!
    @IBOutlet weak var totalEranings: UITextField!
    @IBOutlet weak var textview: UITextView!
    
    // initialization
    var projectNameInWorkOrder: String = ""
    var totalCostInWorkOrder: Int = 0
    var employeeNameInWorkOrder: String = ""
    var totalEraningsInWorkOrder: Int = 0
    
    // submit button
    @IBAction func submitBtn(_ sender: UIButton) {
        // display the message in textview
        textview.text = "Thanks for the order, looking forward to working with you"
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // display all stored property values
        projectName.text = "Project Name: \(projectNameInWorkOrder)"
        totalCost.text = "Total Cost of the project: $\(String(totalCostInWorkOrder))"
        employeeName.text = "Employee Name: \(employeeNameInWorkOrder)"
        totalEranings.text = "Total Eearnings of the Employee: $\(String(totalEraningsInWorkOrder))"
    }
}// end class
