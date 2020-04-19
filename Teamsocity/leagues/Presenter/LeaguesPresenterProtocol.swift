//
//  LeaguesPresenterProtocol.swift
//  Teamsocity
//
//  Created by Abd-Elmalek on 4/19/20.
//  Copyright © 2020 ITI. All rights reserved.
//

import Foundation

protocol LeaguesPresenterProtocol{
   
    
    func loadLeagues(leagueName: String)
    
    func updateUI(with notification: Notification)
    
}
