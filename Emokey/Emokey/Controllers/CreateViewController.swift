//
//  CreateViewController.swift
//  Emokey
//
//  Created by Nicole Meza Sanchez on 9/15/18.
//  Copyright © 2018 ShellHacks. All rights reserved.
//

import Foundation
import UIKit

class CreateViewController: UIViewController {
    
    @IBOutlet weak var FacebookButton: UIButton!
    @IBOutlet weak var TwitterButton: UIButton!
    @IBOutlet weak var InstagramButton: UIButton!
    
    override func viewDidLoad() {
    super.viewDidLoad()
    }
        
    @IBAction func facebookButtonTapped(_ sender: UIButton) {
        print("Going to facebook");
    }
    @IBAction func twitterButtonTapped(_ sender: UIButton) {
        print("Going to Twitter");
    }
    @IBAction func instagramButtonTapped(_ sender: UIButton) {
        print("Going to Instagram");
    }
}
