//
//  SuitsTableViewCell.swift
//  Lec9
//
//  Created by hackeru on 10 Sivan 5778.
//  Copyright © 5778 student.roey.honig. All rights reserved.
//

import UIKit

class SuitsTableViewCell: UITableViewCell {
    var mem: Member!
    @IBAction func tapped(_ sender: UIButton) {
        // do something with regards to the mem
        // look at the TableviewController to see how we init it
    }
    @IBOutlet weak var firstNameLabel: UILabel!
    @IBOutlet weak var lastNameLable: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
