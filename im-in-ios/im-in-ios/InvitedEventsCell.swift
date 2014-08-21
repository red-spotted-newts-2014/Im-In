//
//  InvitedEventsCell.swift
//  im-in-ios
//
//  Created by joel yawili on 8/21/14.
//  Copyright (c) 2014 joel yawili. All rights reserved.
//

import UIKit

class InvitedEventsCell: UITableViewCell {

   
    @IBOutlet weak var authorName: UILabel!
    
    
    @IBOutlet weak var eventName: UILabel!
    
    
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var profilePic: UIImageView!
   
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
