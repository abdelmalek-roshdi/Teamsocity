//
//  TeamDetailsPresenterProtocol.swift
//  Teamsocity
//
//  Created by amlSakr on 4/22/20.
//  Copyright © 2020 ITI. All rights reserved.
//

import Foundation
protocol TeamDetailsPresenterProtocol {
    
    func loadTeamDetails(teamId: String)

func updateUI(with notification: Notification)

}
