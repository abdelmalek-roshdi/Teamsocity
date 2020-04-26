//
//  FavoritesViewController.swift
//  Teamsocity
//
//  Created by Abd-Elmalek on 4/20/20.
//  Copyright © 2020 ITI. All rights reserved.
//

import UIKit
import CoreData

class FavoritesViewController: UIViewController, FaivoritesViewProtocol {
    
    @IBOutlet weak var favoritesTable: UITableView!
    var leagues: [NSManagedObject]?
    var favoritesPresenter:FaivoritesPresenterProtocol?
       var leagueName:String?
       var currentIndex = 0
       var placeHolder:UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        leagues = []
        favoritesPresenter = FavoritesPresenter(favoritesView: self)
        let nib = UINib(nibName: "CustomTableViewCell", bundle: nil)
        self.favoritesTable.register(nib, forCellReuseIdentifier: "cell")
        placeHolder =  UIImage(named: "sport_placeholder")
        favoritesPresenter?.getSavedLeagues()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
         favoritesPresenter?.getSavedLeagues()
         self.favoritesTable.deselectRow(at: favoritesTable.indexPathForSelectedRow ?? IndexPath(row: 0, section: 0), animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
     if (segue.identifier == "leaguesDetailsSegue1"){
         let destination = segue.destination as! LeagueDetailsViewController
        destination.leagueForDetails = leagues?[favoritesTable.indexPathForSelectedRow?.row ?? 0].asLeague()
      }
        
    }
    
   
    

    func updateUIWithSoredData(leagues: [NSManagedObject]) {
        self.leagues = leagues
        favoritesTable.reloadData()
    }

}



extension FavoritesViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.leagues?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomTableViewCell
        currentIndex = indexPath.row
        cell.customImage.kf.indicatorType = .activity
        cell.customImage.kf.setImage(with: URL(string: leagues![indexPath.row].value(forKey: "strBadge") as? String ?? ""),placeholder: self.placeHolder)
        cell.customLable.text = leagues?[indexPath.row].value(forKey: "strLeague") as? String ?? ""
        cell.customButtonOutlet.addTarget(self, action: #selector(buttonAction(sender:)), for: UIControlEvents.touchUpInside)
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    
        return 200
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if Reachability.isConnectedToNetwork(){

            performSegue(withIdentifier: "leaguesDetailsSegue1", sender: tableView.cellForRow(at: indexPath))

        }else {
            showAlert(title: "Not Connected", message: "please connect and try again later", button: "OK")
        }
    }
    
   @objc func buttonAction(sender:UIButton!) {
        
    
    let url = NSURL(string:"https://\(String(describing: leagues?[currentIndex].value(forKey: "strYoutube")))")! as URL
        if UIApplication.shared.canOpenURL(url){
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        } else{
           showAlert(title: "not valid youtube link", message: "sorry for the inconveniece", button: "OK")
        }
       
    }
    
}
