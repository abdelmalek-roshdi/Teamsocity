//
//  EventDataSource.swift
//  Teamsocity
//
//  Created by amlSakr on 4/21/20.
//  Copyright © 2020 ITI. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
class EventDataSource {
    
    static let instance = EventDataSource()
    private init() {
        
    }
    
    func getEvents(id:String) {
        let url = "https://www.thesportsdb.com/api/v1/json/1/eventspastleague.php?id="+id
        var eventssArray = [Event]()
        Alamofire.request(url).response { response in
            
            if let data = response.data {
                
                let json = JSON(data)
                //  print("JSON: \(json)")
                let events = json[Constants.EVENTS].arrayValue
                
                for event in events {
                    let id = event[Constants.idEvent].intValue
                    
                    let name = event[Constants.strEvent].stringValue
                    let date = event[Constants.strDateEvent].stringValue
                    let time = event[Constants.strTimeEvent].stringValue
                    eventssArray.append(Event(ID: id , eventName: name ,  eventDate: date , eventTime: time ))
                    
                    //let name = sport["strSport"]
                 //   print("name"+name)
                }
                NotificationCenter.default.post(name: .eventssArrayName, object: self, userInfo: [Constants.eventsArrayNotification:eventssArray])
            }
            
//            print("size")
//            print(eventssArray.count)
           // self.eventsCollectionView.reloadData()
    
             debugPrint(response.data)
        }
    }
    
    func getLatestResults(id: String) {
        let url = "https://www.thesportsdb.com/api/v1/json/1/eventspastleague.php?id="+id
        var latestResultsArray = [Event]()
        Alamofire.request(url).response { response in
            
            if let data = response.data {
                
                let json = JSON(data)
                //  print("JSON: \(json)")
                let latestResults = json[Constants.EVENTS].arrayValue
                
                for result in latestResults {
                    let id = result[Constants.idEvent].intValue
                    
                    let name = result[Constants.strEvent].stringValue
                    let date = result[Constants.strDateEvent].stringValue
                    let time = result[Constants.strTimeEvent].stringValue
                   
                     let intHomeScore = result[Constants.strTimeEvent].int
                     let intAwayScore = result[Constants.strTimeEvent].stringValue
                    latestResultsArray.append(Event(ID: id , eventName: name ,  eventDate: date , eventTime: time ))
                    
                    //let name = sport["strSport"]
             //       print("name"+name)
                }
                NotificationCenter.default.post(name: .latestResultsArrayName, object: self, userInfo: [Constants.latestArrayNotification:latestResultsArray])
            }
            
//            print("size")
//            print(latestResultsArray.count)
//            print("Latest Result")
            // self.eventsCollectionView.reloadData()
            
            debugPrint(response.data)
        }
    }
    
    func getTeam(id:String) {
        let url = "https://www.thesportsdb.com/api/v1/json/1/lookup_all_teams.php?id="+id
        var teamsArray = [Team]()
        Alamofire.request(url).response { response in
            
            if let data = response.data {
                
                let json = JSON(data)
                //  print("JSON: \(json)")
                let teams = json[Constants.TEAMS].arrayValue
                
                for team in teams {
                    let id = team[Constants.idTeam].intValue
                    
                    let url = team[Constants.strTeamBadge].stringValue
                  
                    teamsArray.append(Team(imageURL: url, ID: id))
                    
                    //let name = sport["strSport"]
                  //  print("url"+url)
                }
                NotificationCenter.default.post(name: .teamsArrayName, object: self, userInfo: [Constants.teamsArrayNotification:teamsArray])
            }
            
//            print("size Team Array")
//            print(teamsArray.count)
//                print("Team Array")
            // self.eventsCollectionView.reloadData()
            
            debugPrint(response.data)
        }
    }
}
