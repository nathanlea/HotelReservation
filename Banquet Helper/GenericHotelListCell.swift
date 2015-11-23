//
//  HotelListCell.swift
//  Banquet Helper
//
//  Created by KEVIN ANGEL on 11/17/15.
//  Copyright © 2015 Okstate. All rights reserved.
//

import UIKit

class GenericHotelListCell: UITableViewCell {
    
    @IBOutlet weak var TitleLabel: UILabel!
    @IBOutlet weak var DetailLabel: UILabel!
    @IBOutlet weak var MoreDetailsIfNeeded: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
