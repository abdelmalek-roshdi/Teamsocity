//
//  MainDataSource.swift
//  Teamsocity
//
//  Created by Abd-Elmalek on 4/18/20.
//  Copyright © 2020 ITI. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
class MainDataSource{
  
    func getSports() {
        
        Alamofire.request(Constants.BASE_URL_MAIN).response { response in
            
          
            if let data = response.data {
                var sportsArray = [Sport]()
                let json = JSON(data)
                               print("JSON: \(json)")
                           let sports = json[Constants.SPORTS].arrayValue
                               
                           for sport in sports {
                            let id = sport[Constants.idSport].intValue
                            
                            let name = sport[Constants.strSport].stringValue
                            let thumbnail = sport[Constants.strSportThumb].stringValue
                            let format = sport[Constants.strFormat].stringValue
                            let desc = sport[Constants.strSportDescription].stringValue
                            let thumbnailGreen = sport[Constants.strSportThumbGreen].stringValue
                            
                            sportsArray.append(Sport(idSport: id, strSport: name, strFormat: format, strSportThumb: thumbnail, strSportThumbGreen: thumbnailGreen, strSportDescription: desc))
                            
                               //let name = sport["strSport"]
                               print(name)
                           }
                NotificationCenter.default.post(name: .sportsArrayName, object: self, userInfo: [Constants.sportsArrayNotification:sportsArray])
            }
            
           
            
            
            debugPrint(response.data)
       }
    }
}
