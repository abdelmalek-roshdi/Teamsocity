//
//  FaivoritesDataSource.swift
//  Teamsocity
//
//  Created by Abd-Elmalek on 4/20/20.
//  Copyright © 2020 ITI. All rights reserved.
//

import Foundation
import CoreData
import UIKit
class FavoritesDataSource: GetFavoritesLeaguesProtocol, SaveLeagueProtocol {
    
    private let appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
    private var managedContex: NSManagedObjectContext?
    
    private let concurrentFavoritesQueue =
    DispatchQueue(
      label: "favoritesQueue",
      attributes: .concurrent)

    static let instance = FavoritesDataSource()
    private init(){
        managedContex = appDelegate.persistentContainer.viewContext
    }
    
    func getFavorites(){
        concurrentFavoritesQueue.async(flags: .barrier) { [weak self] in

          guard let self = self else {return}

            let savedLeagues = self.getSavedLeaguesByEntityName("LeaguesEntity")

           DispatchQueue.main.async { [weak self] in
             NotificationCenter.default.post(name: .savedLeaguesArrayName, object: self, userInfo: [Constants.savedLeaguesArrayNotification: savedLeagues,"status": "sucess"])
           }
         }
    }
    
    
    private func getSavedLeaguesByEntityName(_ entity:String) -> [NSManagedObject] {
                       let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entity)
                        
                         do {
                             if let mContext = managedContex{
                                 let results = try mContext.fetch(fetchRequest) as? [NSManagedObject]
                                 if let savedLeagues = results {
                                 return  savedLeagues
                                     
                                 }
                             }
                         } catch let error {
                             print("get all data in leagueEntity error :", error)
                         }
                    return [NSManagedObject]()
                }
    
    func saveLeague(league: League) {
        if let mContext = self.managedContex{
            
            let leagueEntity = NSEntityDescription.insertNewObject(forEntityName: "LeaguesEntity", into: mContext)
           
            leagueEntity.setValue(league.strLeague, forKey: "strLeague")
            leagueEntity.setValue(league.strBadge, forKey: "strBadge")
            leagueEntity.setValue(league.strYoutube, forKey: "strYoutube")
            leagueEntity.setValue(league.idLeague, forKey: "idLeague")
            leagueEntity.setValue(league.strDivision, forKey: "strDivision")
            
            do{
                try mContext.save()
                
            }catch let error as NSError {
                print(error.debugDescription)
            }
            
          
        }
    }
    
    func deleteSoredLeague(league: League){
        DispatchQueue.global(qos: .background).async {[weak self] in
            guard let self = self else {return}
            do {
                
                if let mContext = self.managedContex{
                           mContext.delete(league.toNSMangedObject())
                    try self.managedContex?.save()
                       }
                   } catch let error {
                       print("Detele all data in LeaguesEntity error :", error)
                   }
        }
    }
    
    func isFovorite(leagueId: Int)-> Bool{
       do {
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "LeaguesEntity")
        fetchRequest.predicate = NSPredicate(format: "idLeague == %@", leagueId.description)
            
          if let mContext = self.managedContex{
                let result = try mContext.fetch(fetchRequest)
            if result.count > 0 {
                return true
            }
                  }
              } catch let error {
                  print("Detele all data in LeaguesEntity error :", error)
              }
        return false
    }
}
