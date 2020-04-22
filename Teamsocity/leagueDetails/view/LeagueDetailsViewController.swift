//
//  LeagueDetailsViewController.swift
//  Teamsocity
//
//  Created by amlSakr on 4/20/20.
//  Copyright © 2020 ITI. All rights reserved.
//

import UIKit


class LeagueDetailsViewController: UIViewController ,UICollectionViewDataSource , UICollectionViewDelegate , LeagueDetailsViewPotocol {
    func updateUIViewEvent(events: [Event]) {
        eventssArray = events
        eventsCollectionView.reloadData()
    }
    

    

  
    @IBOutlet weak var addLeagueTofavorites: UIButton!
    
    @IBOutlet weak var latestResultsCollectionView: UICollectionView!
    @IBOutlet weak var eventsCollectionView: UICollectionView!
    
    @IBOutlet weak var teamsCollectionView: UICollectionView!
    var eventssArray:[Event]?
    
    var leagueDetailsProtocol:LeagueDetailsProtocol?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.eventsCollectionView.delegate = self
        self.eventsCollectionView.dataSource = self
        leagueDetailsProtocol = LeagueDetailsPresenter(leagueDetailsView: self)
        leagueDetailsProtocol?.loadEvents()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func AddLeagueToFavoriteAction(_ sender: Any) {
    }
    
     func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return  eventssArray?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = eventsCollectionView.dequeueReusableCell(withReuseIdentifier: "eventCell", for: indexPath) as! EventCollectionViewCell
        cell.eventName.text = eventssArray![indexPath.row].eventName
        cell.eventDate.text = eventssArray![indexPath.row].eventDate
        cell.eventTime.text = eventssArray![indexPath.row].eventTime

        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    


}
