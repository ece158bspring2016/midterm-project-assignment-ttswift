//
//  TableViewCell.swift
//  midtermYikYak
//
//  Created by Pablo Volpe on 4/22/16.
//  Copyright © 2016 Pablo. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var yakText: UILabel!
    
    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var count: UILabel!
    @IBOutlet weak var replies: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
