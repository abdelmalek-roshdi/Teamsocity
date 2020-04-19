//
//  LeaguesDataSource.swift
//  Teamsocity
//
//  Created by Abd-Elmalek on 4/19/20.
//  Copyright © 2020 ITI. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
class LeaguesDataSource{
    
    static let instance = LeaguesDataSource()
    
    private init(){}
  
     func getLeagues(sportName: String) {
        
        Alamofire.request(Constants.BASE_URL_LEAGUES + sportName.replacingOccurrences(of: " ", with: "_", options: .literal, range: nil)).response { response in
            
            if let statusCode = response.response?.statusCode{
                var leaguesArray = [League]()
                if statusCode == 200 {
                    if let data = response.data {
                             
                              let json = JSON(data)
                                             
                                         let leagues = json[Constants.COUNTRYS].arrayValue
                                             
                                         for league in leagues {
                                          let id = league[Constants.idLeague].intValue
                                          let name = league[Constants.strLeague].stringValue
                                          let badge = league[Constants.strBadge].stringValue
                                          let devision = league[Constants.strDivision].stringValue
                                          let youtube = league[Constants.strYoutube].stringValue
                                          
                                          leaguesArray.append(League(idLeague: id, strLeague: name, strDivision: devision, strYoutube: youtube, strBadge: badge))
                                          
                                             //let name = sport["strSport"]
                                             //print(name)
                                         }
                              NotificationCenter.default.post(name: .leaguesArrayName, object: self, userInfo: [Constants.leaguesArrayNotification:leaguesArray,"status" : "sucess"])
                          }
                          
                         
                          
                          
                          
                }
            } else {
                
                NotificationCenter.default.post(name: .leaguesArrayName, object: self, userInfo: [Constants.leaguesArrayNotification:[League](),"status" : "failed"])
            }
            
      
       }
    }
}

