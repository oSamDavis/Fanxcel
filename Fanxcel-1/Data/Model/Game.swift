//
//  Game.swift
//  Fanxcel-1
//
//  Created by Sam Davis Omekara  on 3/10/23.
//

import Foundation


struct Game : Identifiable,Codable {
    let id: String
    let stadium: String
    let team1Name: String
    let team1Icon: String
    let team2Name: String
    let team2Icon: String
    let finalScore: String
}
