//
//  LeaguesViewController.swift
//  Teamsocity
//
//  Created by Abd-Elmalek on 4/19/20.
//  Copyright © 2020 ITI. All rights reserved.
//

import UIKit

class LeaguesViewController: UIViewController, LeaguesViewProtocol {
    
    @IBOutlet weak var tableView: UITableView!
    var leagues:[League]?
    var leaguesPresenter:LeaguesPresenter?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        leagues = []
        leaguesPresenter = LeaguesPresenter(leaguesView: self)
        let nib = UINib(nibName: "CustomTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "cell")
        // Do any additional setup after loading the view.
    }
    
    func updateUIViewLeaguesData(leagues: [League]) {
        self.leagues = leagues
        self.tableView.reloadData()
        leaguesPresenter?.loadLeagues(leagueName: "Soccer")
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

extension LeaguesViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.leagues?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomTableViewCell
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    
        return 200
    }
    
    
}
