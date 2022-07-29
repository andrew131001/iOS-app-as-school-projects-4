//
//  DetailsViewController.swift
//  Exercise01
//
//  Created by Andrew Ok on 2022-07-27.
//

import UIKit

class DetailsViewController: UIViewController {
    
    @IBOutlet weak var poster_detail: UIImageView!
    @IBOutlet weak var title_detail: UILabel!
    @IBOutlet weak var year_detail: UILabel!
    @IBOutlet weak var runningtime_detail: UILabel!
    @IBOutlet weak var directorname_detail: UILabel!
    
    // declare variables to hold data
    var img = UIImage()
    var titleLabel = ""
    var yearLabel = ""
    var runningtime = ""
    var directorName = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //assign data to each items
        title_detail.text = titleLabel
        year_detail.text = yearLabel
        runningtime_detail.text = runningtime
        directorname_detail.text = directorName
        poster_detail.image = img
    }
}// end class
