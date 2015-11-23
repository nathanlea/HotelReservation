//
//  MeetingRoomListCell.swift
//  Banquet Helper
//
//  Created by KEVIN ANGEL on 11/20/15.
//  Copyright © 2015 Okstate. All rights reserved.
//

import UIKit

class MeetingRoomListCell: UITableViewCell {

    @IBOutlet weak var MeetingRoomLabel: UILabel!
    @IBOutlet weak var PriceLabel: UILabel!
    @IBOutlet weak var MaxOccupancyLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
