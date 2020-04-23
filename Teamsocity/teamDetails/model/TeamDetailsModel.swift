//
//  TeamDetailsModel.swift
//  Teamsocity
//
//  Created by amlSakr on 4/22/20.
//  Copyright © 2020 ITI. All rights reserved.
//

import Foundation
class TeamDetailsModel {
    
    var teamID: Int?
    var teamName : String?
    var countryTeam : String?
    var formedYear : String?
    var leagueName : String?
    var teamImage : String?
    var stadiumImage : String?
    var stadiumName : String?
    var stadiumLocation : String?
    
    init(teamID: Int, teamName : String,
     countryTeam : String,formedYear : String, leagueName : String,
     teamImage : String, stadiumImage : String, stadiumName : String,
     stadiumLocation : String) {
        self.teamID = teamID
        self.teamName = teamName
        self.countryTeam = countryTeam
        self.formedYear = formedYear
        self.leagueName = leagueName
        self.teamImage = teamImage
        self.stadiumImage = stadiumImage
        self.stadiumName = stadiumName
        self.stadiumLocation = stadiumLocation
    }
    
}
