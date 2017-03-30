//
//  GameThreeViewController.swift
//  On the Spot
//
//  Created by Jasmine Skye Batten on 3/30/17.
//  Copyright © 2017 Power of Play. All rights reserved.
//

import UIKit

class GameThreeViewController: UIViewController
{

    var gf3: GameFunctions! = nil
    var prompts: [String?] = []
    
    @IBOutlet weak var teamOnePointsLabel: UILabel!
    @IBOutlet weak var promptsLabel: UILabel!
    @IBOutlet weak var teamTwoPointsLabel: UILabel!
    
    
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
            gf3.addPoints(team: 0, numberOfPoints: 10)
        case 1:
            gf3.addPoints(team: 1, numberOfPoints: 10)
        default:
            break
        }
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        //set labels
        teamOneLabel.setTitle(gf3.names[0], for: .normal)
        teamTwoLabel.setTitle(gf3.names[1], for: .normal)
        teamOneLabel.sizeToFit()
        teamTwoLabel.sizeToFit()
        teamOnePointsLabel.text = String(gf3.getPoints(team: 0))
        teamTwoPointsLabel.text = String(gf3.getPoints(team: 1))
        
        
        //randomize prompts for specified files
        prompts = gf3.arrayFromText(fileName: "SAIQuestions")!
        let random = Int(arc4random_uniform(UInt32(prompts.count)))
        promptsLabel.text = gf3.randomPrompt(arrayOfText: prompts, randomNumber: random)
        
        //UI touch up
        promptsLabel.sizeToFit()
    }
    
    
}
