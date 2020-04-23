//
//  LeagueDetailsViewController.swift
//  Teamsocity
//
//  Created by amlSakr on 4/20/20.
//  Copyright © 2020 ITI. All rights reserved.
//

import UIKit


class LeagueDetailsViewController: UIViewController ,UICollectionViewDataSource , UICollectionViewDelegate , LeagueDetailsViewPotocol {
    func updateUIViewLatestResult(latestResult: [Event]) {
         print("updateUIViewLatestResult")
        latestResultsArray = latestResult
        latestResultsCollectionView.reloadData()
    }
    
    func updateUIViewTeam(teams: [Team]) {
        teamsArray = teams
        print("updateUIViewTeam")
        teamsCollectionView.reloadData()
    }
    
    func updateUIViewEvent(events: [Event]) {
       // print("updateUIViewEvent")
        eventssArray = events
        eventsCollectionView.reloadData()
    }
    
    @IBOutlet weak var addLeagueTofavorites: UIButton!
    
    @IBOutlet weak var latestResultsCollectionView: UICollectionView!
    @IBOutlet weak var eventsCollectionView: UICollectionView!
    
    @IBOutlet weak var teamsCollectionView: UICollectionView!
    var eventssArray:[Event]?
    var latestResultsArray:[Event]?
    var teamsArray:[Team]?
    
    var leagueDetailsProtocol:LeagueDetailsProtocol?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.eventsCollectionView.delegate = self
        self.eventsCollectionView.dataSource = self
        
        self.latestResultsCollectionView.delegate = self
        self.latestResultsCollectionView.dataSource = self
        
        self.teamsCollectionView.delegate = self
        self.teamsCollectionView.dataSource = self
        
    
        leagueDetailsProtocol = LeagueDetailsPresenter(leagueDetailsView: self)
        leagueDetailsProtocol?.loadEvents()

        leagueDetailsProtocol?.loadLatestResults()
        leagueDetailsProtocol?.loadTeams()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func AddLeagueToFavoriteAction(_ sender: Any) {
    }
    
     func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
          if (collectionView == self.eventsCollectionView) {
                return  eventssArray?.count ?? 0
        } else if (collectionView == self.latestResultsCollectionView){
            return  latestResultsArray?.count ?? 0
          } else {
            return  teamsArray?.count ?? 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.latestResultsCollectionView {
            let    cell = latestResultsCollectionView.dequeueReusableCell(withReuseIdentifier: "latestResultCell", for: indexPath) as! LastResultCollectionViewCell
            cell.teamsName.text = latestResultsArray![indexPath.row].eventName
            cell.teamScore.text = String (describing: latestResultsArray![indexPath.row].intHomeScore )
                + " VS " + String (describing: latestResultsArray![indexPath.row].intAwayScore )
            cell.teamDate.text = latestResultsArray![indexPath.row].eventDate
            cell.teamTime.text = latestResultsArray![indexPath.row].eventTime
            print("cell latest result")
            return cell
        }
        else if collectionView == self.eventsCollectionView {
            let    cell = eventsCollectionView.dequeueReusableCell(withReuseIdentifier: "eventCell", for: indexPath) as! EventCollectionViewCell
            cell.eventName.text = eventssArray![indexPath.row].eventName
            cell.eventDate.text = eventssArray![indexPath.row].eventDate
            cell.eventTime.text = eventssArray![indexPath.row].eventTime
             print("cell events cell")
            return cell
            
        }else  if collectionView == self.teamsCollectionView  {
              let  cell = teamsCollectionView.dequeueReusableCell(withReuseIdentifier: "teamCell", for: indexPath) as! TeamCollectionViewCell
            cell.teamImageView.kf.setImage(with: URL(string: teamsArray![indexPath.row].imageURL))
            print("team cell")
             return cell
            
        }
   
        return UICollectionViewCell()
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        if (collectionView == self.eventsCollectionView) {
            return 1
        } else if (collectionView == self.latestResultsCollectionView){
            return  1
        } else {
            return 1
        }
    }
    


}
