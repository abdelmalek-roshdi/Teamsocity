//
//  TeamDetailsDataSource.swift
//  Teamsocity
//
//  Created by amlSakr on 4/22/20.
//  Copyright © 2020 ITI. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
class TeamDetailsDataSource {
    
    
    static let instance = TeamDetailsDataSource()
    
    private init (){
        
    }
    func getTeamDetails(id: String) {
        let url = "https://www.thesportsdb.com/api/v1/json/1/lookupteam.php?id="+id
        Alamofire.request(url).response { response in
            
            
            if let data = response.data {
                var teamDetails = [TeamDetailsModel]()
                let json = JSON(data)
              //  print("JSON: \(json)")
                let teamDetailsModel = json[Constants.TEAMS].arrayValue[0]
                
                
                    let id = teamDetailsModel[Constants.idTeam].intValue
                    
                    let name = teamDetailsModel[Constants.strTeam].stringValue
                    let teamImage = teamDetailsModel[Constants.strTeamBadge].stringValue
                    let country = teamDetailsModel[Constants.strCountry].stringValue
                let league = teamDetailsModel[Constants.strLeague].stringValue
                    let formedYear = teamDetailsModel[Constants.intFormedYear].stringValue
                let stadiumImage = teamDetailsModel[Constants.strStadiumThumb].stringValue
                let stadiumName = teamDetailsModel[Constants.strStadium].stringValue
                let staduimLocation = teamDetailsModel[Constants.strStadiumLocation].stringValue
                    
         
                
                var myTeamDetails : TeamDetailsModel = TeamDetailsModel(teamID: id, teamName : name, countryTeam : country ,formedYear : formedYear, leagueName : league, teamImage : teamImage, stadiumImage : stadiumImage, stadiumName : stadiumName, stadiumLocation : staduimLocation)
                    
                    //let name = sport["strSport"]
                   // print(name)
                
                NotificationCenter.default.post(name: .teamDetailsName, object: self, userInfo: [Constants.teamDetailsNotification:myTeamDetails])
            
        }
            
            
            
        //    debugPrint(response.data)
        }
    }

}
