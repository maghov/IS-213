//
//  BuildingTableViewCell.swift
//  LoginV1
//
//  Created by Magnus Høvik on 30.05.2017.
//  Copyright © 2017 eoliversen. All rights reserved.
//

import UIKit

class BuildingTableViewCell: UITableViewCell {

    
    @IBOutlet weak var labelBuildingName: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
