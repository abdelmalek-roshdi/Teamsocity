//
//  FaivoritesViewProtocol.swift
//  Teamsocity
//
//  Created by Abd-Elmalek on 4/20/20.
//  Copyright © 2020 ITI. All rights reserved.
//

import Foundation
import CoreData
protocol FaivoritesViewProtocol : AnyObject{
    var leagues:[NSManagedObject]? {get set}
    func updateUIWithSoredData(leagues: [NSManagedObject])
}
