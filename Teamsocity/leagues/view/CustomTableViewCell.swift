//
//  CustomTableViewCell.swift
//  Teamsocity
//
//  Created by Abd-Elmalek on 4/19/20.
//  Copyright © 2020 ITI. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var customButtonOutlet: UIButton!
    @IBOutlet weak var customLable: UILabel!
    @IBOutlet weak var customImage: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
