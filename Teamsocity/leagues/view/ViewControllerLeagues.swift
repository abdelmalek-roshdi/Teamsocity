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
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

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
        cell.customImage.kf.setImage(with: URL(string: leagues![indexPath.row].strBadge),placeholder: self.placeHolder)
        cell.customLable.text = leagues?[indexPath.row].strLeague
        cell.customButtonOutlet.addTarget(self, action: #selector(buttonAction(sender:)), for: UIControlEvents.touchUpInside)
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    
        return 200
    }
    
   @objc func buttonAction(sender:UIButton!) {
        
    let url = URL(fileURLWithPath: (leagues?[currentIndex].strYoutube ?? ""))
       // if UIApplication.shared.canOpenURL(url){
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        //}
    }
    
}

