//
//  ViewControllerLeagues.swift
//  Teamsocity
//
//  Created by Abd-Elmalek on 4/19/20.
//  Copyright © 2020 ITI. All rights reserved.
//

import UIKit

class ViewControllerLeagues: UIViewController , LeaguesViewProtocol {
    

    @IBOutlet weak var leaguesTable: UITableView!
    var leagues:[League]?
    var leaguesPresenter:LeaguesPresenterProtocol?
    var leagueName:String?
    var currentIndex = 0
    var placeHolder:UIImage?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        leagues = []
        leaguesPresenter = LeaguesPresenter(leaguesView: self)
        let nib = UINib(nibName: "CustomTableViewCell", bundle: nil)
        self.leaguesTable.register(nib, forCellReuseIdentifier: "cell")
        placeHolder =  UIImage(named: "sport_placeholder")
        leaguesPresenter?.loadLeagues(leagueName: leagueName!)
        // Do any additional setup after loading the view.
    }
    
    func updateUIViewLeaguesData(leagues: [League]) {
        self.leagues = leagues
        self.leaguesTable.reloadData()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
             
          if (segue.identifier == "leaguesDetailsSegue2"){
              let destination = segue.destination as! LeagueDetailsViewController
              destination.leagueForDetails = leagues?[leaguesTable.indexPathForSelectedRow?.row ?? 0]
           }
             
         }
    
    override func viewWillAppear(_ animated: Bool) {
        self.leaguesTable.deselectRow(at: leaguesTable.indexPathForSelectedRow ?? IndexPath(row: 0, section: 0), animated: true)
    }

}

extension ViewControllerLeagues: UITableViewDelegate, UITableViewDataSource {
    
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
        cell.customImage.kf.setImage(with: URL(string: leagues![indexPath.row].strBadge ?? ""),placeholder: self.placeHolder)
        cell.customLable.text = leagues?[indexPath.row].strLeague
        cell.customButtonOutlet.addTarget(self, action: #selector(buttonAction(sender:)), for: UIControlEvents.touchUpInside)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if Reachability.isConnectedToNetwork(){

            performSegue(withIdentifier: "leaguesDetailsSegue2", sender: tableView.cellForRow(at: indexPath))

        }else {
            showAlert(title: "Not Connected", message: "please connect and try again later", button: "OK")
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    
        return 200
    }
    
   @objc func buttonAction(sender:UIButton!) {
        
         let url = NSURL(string:"https://\(leagues?[currentIndex].strYoutube ?? "")")! as URL
             if UIApplication.shared.canOpenURL(url){
                 UIApplication.shared.open(url, options: [:], completionHandler: nil)
             } else{
                showAlert(title: "not valid youtube link", message: "sorry for the inconveniece", button: "OK")
             }
    }
    
}

