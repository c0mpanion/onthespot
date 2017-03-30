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
    
    //the two team name variables
    
    @IBOutlet weak var teamOneTextField: UITextField!
    @IBOutlet weak var teamTwoTextField: UITextField!
    
    //constants
    var tgf = GameFunctions()
    
    //moves to GameOneViewController when button is pressed
    @IBAction func startPressed(_ sender: UIButton)
    {
        performSegue(withIdentifier: "gameOneSegue", sender: self)
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
    
    
    //team names are moved to the next view controller through a GameOneViewController object
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "gameOneSegue"
        {
            if let gameVC = segue.destination as? GameOneViewController
            {
                tgf.names[0] = teamOneTextField.text
                tgf.names[1] = teamTwoTextField.text
                gameVC.gf = tgf //transfers names to GameOneViewController
            }
        }
    }
}
