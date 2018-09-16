//
//  PasswordTableViewCell.swift
//  Emokey
//
//  Created by Nicole Meza Sanchez on 9/16/18.
//  Copyright © 2018 ShellHacks. All rights reserved.
//

import Foundation
import UIKit
import SCSDKLoginKit

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

    @IBAction func snapchatLoginAction() {
    SCSDKLoginClient.login(from: self) { success, error in
        if let error = error {
            // An error occurred during the login process
            print(error.localizedDescription)
        } else { 
            // The login was a success! This user is now
            // authenticated with Snapchat!
        }
    }
}
}
