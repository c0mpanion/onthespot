//
//  TeamNameViewController.swift
//  On the Spot
//
//  Created by Jasmine Skye Batten on 3/26/17.
//  Copyright © 2017 Power of Play. All rights reserved.
//

import Foundation
import UIKit


class TeamNameViewController: UIViewController
{
    @IBOutlet weak var teamOneTextField: UITextField!
    @IBOutlet weak var teamTwoTextField: UITextField!
    
    @IBAction func startPressed(_ sender: UIButton)
    {
        performSegue(withIdentifier: "gameOneSegue", sender: self)
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "gameOneSegue"
        {
            if let gameVC = segue.destination as? GameOneViewController
            {
                gameVC.names.append(teamOneTextField.text)
                gameVC.names.append(teamTwoTextField.text)
            }
        }
    }
}
