//
//  Event.swift
//  Teamsocity
//
//  Created by amlSakr on 4/21/20.
//  Copyright © 2020 ITI. All rights reserved.
//

import Foundation
 class Event {
   
    var ID : Int
    var eventName : String
    var eventDate : String
    var eventTime : String
    var intHomeScore : Int?
    var intAwayScore : Int?
    
    init(ID:Int , eventName : String , eventDate : String , eventTime : String ,intHomeScore : Int ,  intAwayScore : Int ) {
        self.ID = ID
        self.eventName = eventName
        self.eventDate = eventDate
        self.eventTime = eventTime
        self.intHomeScore = intHomeScore
        self.intAwayScore = intAwayScore
    }
    
   init(ID:Int , eventName : String , eventDate : String , eventTime : String ) {
        self.ID = ID
        self.eventName = eventName
        self.eventDate = eventDate
        self.eventTime = eventTime
    }
    


}
