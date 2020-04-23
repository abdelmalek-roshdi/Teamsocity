//
//  LeagueDetailsPresenter.swift
//  Teamsocity
//
//  Created by amlSakr on 4/21/20.
//  Copyright © 2020 ITI. All rights reserved.
//

import Foundation

class LeagueDetailsPresenter : LeagueDetailsProtocol {
    func loadLatestResults() {
        dataSource?.getLatestResults()
        print("loadLatestResults")
    }
    
   @objc   func updateUIWithLatestResults(with notification: Notification) {
             leagueDetailsView?.updateUIViewLatestResult(latestResult: notification.userInfo? [Constants.latestArrayNotification]
                as! [Event])
    }
    
    func loadTeams() {
        dataSource?.getTeam()
         print("loadTeam")
    }
    
 @objc     func updateUIWithTeams(with notification: Notification) {
        leagueDetailsView?.updateUIViewTeam(teams: notification.userInfo? [Constants.teamsArrayNotification] as! [Team])
    }
    
    
    var leagueDetailsView:LeagueDetailsViewPotocol?
        var dataSource:EventDataSource?
    
    func loadEvents() {
   
          print("loadEvents")
        dataSource?.getEvents()
        
    }
    
 @objc   func updateUI(with notification: Notification) {
             leagueDetailsView?.updateUIViewEvent(events: notification.userInfo?[Constants.eventsArrayNotification] as! [Event]
        )
    }

    
    init(leagueDetailsView: LeagueDetailsViewPotocol) {
        
        dataSource = EventDataSource.instance
        self.leagueDetailsView = leagueDetailsView
        
        NotificationCenter.default.addObserver(self, selector: #selector(updateUI(with:)), name: .eventssArrayName, object: nil)
        
            NotificationCenter.default.addObserver(self, selector: #selector(updateUIWithLatestResults(with:)), name: .latestResultsArrayName, object: nil)
        
            NotificationCenter.default.addObserver(self, selector: #selector(updateUIWithTeams(with:)), name: .teamsArrayName, object: nil)
    }
}




