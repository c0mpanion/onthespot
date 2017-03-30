//
//  Game Functions.swift
//  On the Spot
//
//  Created by Jasmine Skye Batten on 3/29/17.
//  Copyright © 2017 Power of Play. All rights reserved.
//

import Foundation

class GameFunctions
{
    var teamPoints: [Int] = [0, 0]
    var names: [String?] = ["", ""]
    
    func getPoints(team: Int) -> Int
    {
        return teamPoints[team]
    }
    
    func addPoints(team: Int, numberOfPoints: Int)
    {
        teamPoints[team] += numberOfPoints
    }
    
    func arrayFromText(fileName: String) -> [String]?
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
    
    func randomPrompt(arrayOfText: [String?], randomNumber: Int) -> String?
    {
        return arrayOfText[randomNumber]
    }
    
}
