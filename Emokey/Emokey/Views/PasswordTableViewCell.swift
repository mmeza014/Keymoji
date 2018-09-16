//
//  PasswordTableViewCell.swift
//  Emokey
//
//  Created by Nicole Meza Sanchez on 9/16/18.
//  Copyright © 2018 ShellHacks. All rights reserved.
//

import Foundation
import UIKit

class PasswordTableViewCell: UITableViewCell {
    
    var password: CoreDataPassword?
    
    @IBOutlet weak var bitmojiImageView: UIImageView!
    @IBOutlet weak var companyTitleLabel: UILabel!
    @IBOutlet weak var emojiPasswordLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }

    }
