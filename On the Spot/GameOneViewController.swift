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
    //variables
    var prompts: [String?] = []
    var answers: [String?] = []
    var gf: GameFunctions! = nil
    
    //labels
    @IBOutlet weak var teamOnePointsLabel: UILabel!
    @IBOutlet weak var teamTwoPointsLabel: UILabel!
    @IBOutlet weak var promptsLabel: UILabel!
    @IBOutlet weak var answersLabel: UILabel!
    @IBOutlet weak var teamOneLabel: UIButton!
    @IBOutlet weak var teamTwoLabel: UIButton!
    
    
    //adds 10 points to team one's point counter if judge picks team one
    
    @IBAction func teamChosen(_sender: Any)
    {
        guard let button = _sender as? UIButton else
        {
            return
        }
        switch button.tag
        {
        case 0:
            gf.addPoints(team: 0, numberOfPoints: 10)
        case 1:
            gf.addPoints(team: 1, numberOfPoints: 10)
        default:
            break
        }
        performSegue(withIdentifier: "gameTwoSegue", sender: self)
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        //set labels
        teamOneLabel.setTitle(gf.names[0], for: .normal)
        teamTwoLabel.setTitle(gf.names[1], for: .normal)
        teamOneLabel.sizeToFit()
        teamTwoLabel.sizeToFit()
        
        
        //randomize prompts for specified files
        prompts = gf.arrayFromText(fileName: "CLQuestions")!
        answers = gf.arrayFromText(fileName: "CLAnswers")!
        
        let random = Int(arc4random_uniform(UInt32(prompts.count)))
        promptsLabel.text = gf.randomPrompt(arrayOfText: prompts, randomNumber: random)
        answersLabel.text = gf.randomPrompt(arrayOfText: answers, randomNumber: random)
        
        //UI touch up
        promptsLabel.sizeToFit()
        answersLabel.sizeToFit()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.identifier == "gameTwoSegue"
        {
            if let game2VC = segue.destination as? GameTwoViewController
            {
                game2VC.gf2 = gf //transfers data to GameTwoViewController
            }
        }
    }
}
