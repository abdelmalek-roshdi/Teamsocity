//
//  LeaguesModel.swift
//  Teamsocity
//
//  Created by Abd-Elmalek on 4/19/20.
//  Copyright © 2020 ITI. All rights reserved.
//

import Foundation
import CoreData
struct League {
    var idLeague: Int
    var strLeague: String
    var strDivision: String
    var strYoutube: String
    var strBadge: String
    
}
extension League{
     func toNSMangedObject() -> NSManagedObject{
        let leagueObject = NSManagedObject()
              leagueObject.setValue(self.strLeague, forKey: "strLeague")
              leagueObject.setValue(self.strBadge, forKey: "strBadge")
              leagueObject.setValue(self.strYoutube, forKey: "strYoutube")
              leagueObject.setValue(self.idLeague, forKey: "idLeague")
              leagueObject.setValue(self.strDivision, forKey: "strDivision")
              return leagueObject
    }
}
