//
//  GameOneViewController.swift
//  On the Spot
//
//  Created by Jasmine Skye Batten on 3/26/17.
//  Copyright © 2017 Power of Play. All rights reserved.
//

import Foundation
import UIKit

class GameOneViewController: UIViewController
{
    
    var name: String?
    @IBOutlet weak var teamNameLabel: UILabel!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        teamNameLabel.text = name
    }
}
