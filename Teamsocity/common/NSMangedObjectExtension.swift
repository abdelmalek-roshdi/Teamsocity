//
//  NSMangedObjectExtension.swift
//  Teamsocity
//
//  Created by Abd-Elmalek on 4/25/20.
//  Copyright © 2020 ITI. All rights reserved.
//

import Foundation
import CoreData

extension NSManagedObject {
    func asLeague() -> League {
        return League(idLeague: self.value(forKey: "idLeague") as? Int, strLeague: self.value(forKey: "strLeague") as? String, strDivision: self.value(forKey: "strDivision") as? String, strYoutube: self.value(forKey: "strYoutube") as? String, strBadge: self.value(forKey: "strBadge") as? String)
    }
}
