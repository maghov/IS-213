//
//  ViewControllerTableViewCell.swift
//  RoomBooking3
//
//  Created by Gruppe10 on 19/04/2017.
//  Copyright © 2017 Gruppe10. All rights reserved.
//

import UIKit

class ViewControllerTableViewCell: UITableViewCell {
    @IBOutlet weak var lblName: UILabel!
    
    @IBOutlet weak var lblDetails: UILabel!
    @IBOutlet weak var lblSpace: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
