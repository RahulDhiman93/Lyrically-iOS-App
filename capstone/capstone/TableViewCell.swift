//
//  TableViewCell.swift
//  capstone
//
//  Created by Rahul Dhiman on 28/12/17.
//  Copyright © 2017 Rahul Dhiman. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet var artistName: UILabel!
   
    @IBOutlet var TitleName: UILabel!
    
    @IBOutlet var cellLyrics: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
