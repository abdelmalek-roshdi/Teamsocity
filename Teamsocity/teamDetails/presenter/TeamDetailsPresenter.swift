//
//  TeamDetailsPresenter.swift
//  Teamsocity
//
//  Created by amlSakr on 4/22/20.
//  Copyright © 2020 ITI. All rights reserved.
//

import Foundation
class TeamDetailsPresenter : TeamDetailsPresenterProtocol {
    var teamDetailsView:TeamDetailsViewProtocol?
    var dataSource:TeamDetailsDataSource?
    func loadTeamDetails(teamId: String) {
        dataSource?.getTeamDetails(id: teamId)
    }
    
   @objc func updateUI(with notification: Notification) {
            teamDetailsView?.updateUITeamDetailsView(teamDetailsModel: notification.userInfo?[Constants.teamDetailsNotification] as! TeamDetailsModel)
    }
    
    init(teamDetails: TeamDetailsViewProtocol) {
        
        dataSource = TeamDetailsDataSource.instance
        self.teamDetailsView = teamDetails
        
        NotificationCenter.default.addObserver(self, selector: #selector(updateUI(with:)), name: .teamDetailsName, object: nil)
    }
    
}

