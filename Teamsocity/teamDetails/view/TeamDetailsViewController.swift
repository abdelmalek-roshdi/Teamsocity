//
//  TeamDetailsViewController.swift
//  Teamsocity
//
//  Created by amlSakr on 4/22/20.
//  Copyright © 2020 ITI. All rights reserved.
//

import UIKit

class TeamDetailsViewController: UIViewController , TeamDetailsViewProtocol{


    
   
    @IBOutlet weak var teamImage: UIImageView!
    @IBOutlet weak var teamFormedYear: UITextView!
    @IBOutlet weak var teamCountrt: UITextView!
    @IBOutlet weak var leagueName: UITextView!
    @IBOutlet weak var teamName: UITextView!
    @IBOutlet weak var stadiumName: UITextView!
    @IBOutlet weak var staduimImage: UIImageView!
    @IBOutlet weak var staduimLocation: UITextView!
    var detailsModel:TeamDetailsModel?
    var teamDetailsPresenter : TeamDetailsPresenterProtocol?
    
    var teamId:String?
    override func viewDidLoad() {
        super.viewDidLoad()
        teamDetailsPresenter = TeamDetailsPresenter(teamDetails: self)
        teamDetailsPresenter?.loadTeamDetails(teamId: teamId ?? "")
      

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    func updateUITeamDetailsView(teamDetailsModel: TeamDetailsModel) {
        self.detailsModel = teamDetailsModel
        loadData()
    }
    func loadData() {
   
        print( "team Name"  + (self.detailsModel?.teamImage)!)
        teamImage.kf.setImage(with: URL(string : (self.detailsModel?.teamImage)!))
        teamFormedYear.text = self.detailsModel?.formedYear
      //  teamCountrt.text = self.detailsModel?.stadiumLocation
         leagueName.text = self.detailsModel?.leagueName
        teamName.text = self.detailsModel?.teamName
         stadiumName.text = self.detailsModel?.stadiumName
        
        staduimImage.kf.setImage(with: URL(string : (self.detailsModel?.stadiumImage)!))
        staduimLocation.text = self.detailsModel?.stadiumLocation
    }
    
}
