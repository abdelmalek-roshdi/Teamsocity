//
//  LeagueDetailsViewProtocol.swift
//  Teamsocity
//
//  Created by amlSakr on 4/21/20.
//  Copyright © 2020 ITI. All rights reserved.
//

import Foundation
protocol LeagueDetailsViewPotocol {
    
    func updateUIViewEvent(events: [Event])
    func updateUIViewLatestResult(latestResult: [Event])
    func updateUIViewTeam(teams: [Team])
}
