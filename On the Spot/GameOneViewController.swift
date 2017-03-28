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
    
    var teamOnePoints: Int = 0
    var teamTwoPoints: Int = 0
    var names: [String?] = []
    var prompts: [String?] = []
    var answers: [String?] = []
    
    @IBOutlet weak var teamOnePointsLabel: UILabel!
    @IBOutlet weak var teamTwoPointsLabel: UILabel!
    @IBOutlet weak var promptsLabel: UILabel!
    @IBOutlet weak var answersLabel: UILabel!
    @IBOutlet weak var teamOneLabel: UIButton!
    @IBOutlet weak var teamTwoLabel: UIButton!
    
    @IBAction func teamOneButton(_ sender: Any)
    {
        teamOnePoints += 10
        teamOnePointsLabel.text = String(teamOnePoints)
    }
    
    @IBAction func teamTwoButton(_ sender: Any)
    {
        teamTwoPoints += 10
        teamTwoPointsLabel.text = String(teamTwoPoints)
    }
    
    
    func arrayFromContentsOfFile(fileName: String) -> [String]?
    {
        guard let path = Bundle.main.path(forResource: fileName, ofType: "txt") else
        {
            return nil
        }
        
        do
        {
            let content = try String(contentsOfFile: path, encoding: String.Encoding.utf8)
            return content.components(separatedBy: "\n")
        }
        catch
        {
            return nil
        }
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        teamOneLabel.setTitle(names[0], for: .normal)
        teamTwoLabel.setTitle(names[1], for: .normal)
        teamOneLabel.sizeToFit()
        teamTwoLabel.sizeToFit()
        prompts = arrayFromContentsOfFile(fileName: "CLQuestions")!
        answers = arrayFromContentsOfFile(fileName: "CLAnswers")!
        let promptRandom = Int(arc4random_uniform(UInt32(prompts.count)))
        promptsLabel.text = prompts[promptRandom]
        answersLabel.text = answers[promptRandom]
        promptsLabel.sizeToFit()
        answersLabel.sizeToFit()
    }
    
    
    
}
