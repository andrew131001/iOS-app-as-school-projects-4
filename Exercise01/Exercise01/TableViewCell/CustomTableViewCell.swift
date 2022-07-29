//
//  CustomTableViewCell.swift
//  Exercise01
//
//  Created by Andrew Ok on 2022-07-27.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    @IBOutlet weak var poster_img: UIImageView!
    @IBOutlet weak var movie_title: UILabel!
    @IBOutlet weak var movie_year: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
