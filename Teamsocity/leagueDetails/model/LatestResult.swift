//
//  LatestResult.swift
//  Teamsocity
//
//  Created by amlSakr on 4/21/20.
//  Copyright © 2020 ITI. All rights reserved.
//

import Foundation

class LatestResult {
    var firstTeamName : String?
      var secondTeamName : String?
      var firstTeamScore : String?
      var secondTeamScore : String?
      var date : String?
      var time : String?
    init(firstTeamName : String ,secondTeamName : String ,
        firstTeamScore : String ,  secondTeamScore : String ,
       date : String , time : String  ) {
        self.firstTeamName = firstTeamName
        self.secondTeamName = secondTeamName
        self.firstTeamScore = firstTeamScore
        self.secondTeamScore = secondTeamScore
        self.date = date
        self.time = time
    }
}
