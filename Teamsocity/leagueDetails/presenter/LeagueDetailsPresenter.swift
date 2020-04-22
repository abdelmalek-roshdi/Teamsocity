//
//  LeagueDetailsPresenter.swift
//  Teamsocity
//
//  Created by amlSakr on 4/21/20.
//  Copyright © 2020 ITI. All rights reserved.
//

import Foundation

class LeagueDetailsPresenter : LeagueDetailsProtocol {
    
    var leagueDetailsView:LeagueDetailsViewPotocol?
        var dataSource:EventDataSource?
    
    func loadEvents() {
   
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
    }
}




