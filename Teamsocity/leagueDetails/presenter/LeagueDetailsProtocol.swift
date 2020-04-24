//
//  LeagueDetailsProtocol.swift
//  Teamsocity
//
//  Created by amlSakr on 4/21/20.
//  Copyright © 2020 ITI. All rights reserved.
//

import Foundation
protocol LeagueDetailsProtocol {
    func loadEvents(id:String)
    
    func updateUI(with notification: Notification)
    
    func loadLatestResults(id:String)
    
    func updateUIWithLatestResults(with notification: Notification)
    
    func loadTeams(id:String)
    
    func updateUIWithTeams(with notification: Notification)
    
    func isFovorite(leagueId: Int)-> Bool
    
    func addTofaVorite(league: League)
    
    func removeFromfaVorite(league: League)
}
