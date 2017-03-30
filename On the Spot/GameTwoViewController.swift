//
//  GameTwoViewController.swift
//  On the Spot
//
//  Created by Jasmine Skye Batten on 3/29/17.
//  Copyright © 2017 Power of Play. All rights reserved.
//

import UIKit

class GameTwoViewController: UIViewController

{
    var gf2: GameFunctions! = nil
    var prompts: [String?] = []
    
    @IBOutlet weak var teamOnePointsLabel: UILabel!
    @IBOutlet weak var teamTwoPointsLabel: UILabel!
    @IBOutlet weak var promptsLabel: UILabel!
    @IBOutlet weak var teamOneLabel: UIButton!
    @IBOutlet weak var teamTwoLabel: UIButton!
    
    @IBAction func teamChosen(_sender: Any)
    {
        guard let button = _sender as? UIButton else
        {
            return
        }
        switch button.tag
        {
        case 0:
            gf2.addPoints(team: 0, numberOfPoints: 10)
        case 1:
            gf2.addPoints(team: 1, numberOfPoints: 10)
        default:
            break
        }
        performSegue(withIdentifier: "gameThreeSegue", sender: self)
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        //set labels
        teamOneLabel.setTitle(gf2.names[0], for: .normal)
        teamTwoLabel.setTitle(gf2.names[1], for: .normal)
        teamOneLabel.sizeToFit()
        teamTwoLabel.sizeToFit()
        teamOnePointsLabel.text = String(gf2.getPoints(team: 0))
        teamTwoPointsLabel.text = String(gf2.getPoints(team: 1))
        
        
        //randomize prompts for specified files
        prompts = gf2.arrayFromText(fileName: "IPPrompts")!
        
        let random = Int(arc4random_uniform(UInt32(prompts.count)))
        promptsLabel.text = gf2.randomPrompt(arrayOfText: prompts, randomNumber: random)
        
        //UI touch up
        promptsLabel.sizeToFit()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.identifier == "gameThreeSegue"
        {
            if let game3VC = segue.destination as? GameThreeViewController
            {
                game3VC.gf3 = gf2 //transfers data to GameTwoViewController
            }
        }
    }
}

