//
//  MianPresenter.swift
//  Teamsocity
//
//  Created by Abd-Elmalek on 4/18/20.
//  Copyright © 2020 ITI. All rights reserved.
//

import Foundation

class MainPresenter: MainPresenterProtocol {
    var mainView:MainViewProtocol?
    
    
    @objc func updateUI(with notification: Notification) {
        
        mainView?.updateUIViewSportData(sports: notification.userInfo?[Constants.sportsArrayNotification] as! [Sport])
    }
    
    
    func loadSports() {
        dataSource?.getSports()
    }
    
    
    
     var dataSource:MainDataSource?
    
    init(mainView: MainViewProtocol) {
        
        dataSource = MainDataSource()
        self.mainView = mainView
        
         NotificationCenter.default.addObserver(self, selector: #selector(updateUI(with:)), name: .sportsArrayName, object: nil)
    }
    
}
