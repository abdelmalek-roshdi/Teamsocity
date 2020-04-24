//
//  LeagueDetailsPresenter.swift
//  Teamsocity
//
//  Created by amlSakr on 4/21/20.
//  Copyright © 2020 ITI. All rights reserved.
//

import Foundation

class LeagueDetailsPresenter : LeagueDetailsProtocol {
    
    lazy var dbSource: FavoritesDataSource = FavoritesDataSource.instance
    
    func loadLatestResults(id:String) {
        dataSource?.getLatestResults(id: id)
        print("loadLatestResults")
    }
    
   @objc   func updateUIWithLatestResults(with notification: Notification) {
             leagueDetailsView?.updateUIViewLatestResult(latestResult: notification.userInfo? [Constants.latestArrayNotification]
                as! [Event])
    }
    
    func loadTeams(id:String) {
        dataSource?.getTeam(id: id)
         print("loadTeam")
    }
    
 @objc     func updateUIWithTeams(with notification: Notification) {
        leagueDetailsView?.updateUIViewTeam(teams: notification.userInfo? [Constants.teamsArrayNotification] as! [Team])
    }
    
    
    var leagueDetailsView:LeagueDetailsViewPotocol?
        var dataSource:EventDataSource?
    
    func loadEvents(id:String) {
   
          print("loadEvents")
        dataSource?.getEvents(id: id)
        
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
    func isFovorite(leagueId: Int)-> Bool{
        return dbSource.isFovorite(leagueId: leagueId)
    }
    
    func addTofaVorite(league: League){
        dbSource.saveLeague(league: league)
    }
    
    func removeFromfaVorite(league: League){
        dbSource.deleteSoredLeague(league: league)
    }
}




