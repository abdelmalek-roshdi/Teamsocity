//
//  favoritesPresenter.swift
//  Teamsocity
//
//  Created by Abd-Elmalek on 4/20/20.
//  Copyright © 2020 ITI. All rights reserved.
//

import Foundation
import CoreData
class FavoritesPresenter: FaivoritesPresenterProtocol {
    weak var favoritesView:FaivoritesViewProtocol?
    var dataSource:GetFavoritesLeaguesProtocol?
    
    init(favoritesView:FaivoritesViewProtocol) {
        self.favoritesView = favoritesView
        dataSource = FavoritesDataSource.instance
        NotificationCenter.default.addObserver(self, selector: #selector(updateUI(with:)), name: .savedLeaguesArrayName, object: nil)
    }
    
     @objc func updateUI(with notification: Notification) {
            
        if let favoritesView = favoritesView {
            if (notification.userInfo?["status"] as! String == "sucess"){
              favoritesView.updateUIWithSoredData(leagues: notification.userInfo?[Constants.savedLeaguesArrayNotification] as! [NSManagedObject])
          }
        }
          
            
       }
    
    func getSavedLeagues() {
        dataSource?.getFavorites()
    }
    
    
    

}
