//
//  LeaguesPresenter.swift
//  Teamsocity
//
//  Created by Abd-Elmalek on 4/19/20.
//  Copyright © 2020 ITI. All rights reserved.
//

import Foundation

class LeaguesPresenter: LeaguesPresenterProtocol {
    
    var dataSource: LeaguesDataSource?
    var leaguesView: LeaguesViewProtocol?
    
    init(leaguesView: LeaguesViewProtocol) {
        
        dataSource = LeaguesDataSource.instance
        self.leaguesView = leaguesView
        
         NotificationCenter.default.addObserver(self, selector: #selector(updateUI(with:)), name: .leaguesArrayName, object: nil)
    }
    
    func loadLeagues(leagueName: String) {
        dataSource?.getLeagues(sportName: leagueName)
    }
    
    @objc func updateUI(with notification: Notification) {
        
        if (notification.userInfo?["status"] as! String == "sucess"){
            leaguesView?.updateUIViewLeaguesData(leagues: notification.userInfo?[Constants.leaguesArrayNotification] as! [League])
        }
         
    }
    
    
}
