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
    
    func getEvents() {
        let url = "https://www.thesportsdb.com/api/v1/json/1/eventspastleague.php?id=4328"
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
                    print("name"+name)
                }
                NotificationCenter.default.post(name: .eventssArrayName, object: self, userInfo: [Constants.eventsArrayNotification:eventssArray])
            }
            
            print("size")
            print(eventssArray.count)
           // self.eventsCollectionView.reloadData()
            
             debugPrint(response.data)
        }
    }
}
