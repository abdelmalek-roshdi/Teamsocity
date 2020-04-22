//
//  ViewController.swift
//  Teamsocity
//
//  Created by Abd-Elmalek on 4/17/20.
//  Copyright © 2020 ITI. All rights reserved.
//

import UIKit
import Kingfisher
class ViewController: UIViewController,MainViewProtocol {
    var mySports:[Sport]?
    var mainPressenter:MainPresenterProtocol?
    var collectionViewFlowLayout:UICollectionViewFlowLayout?
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    func updateUIViewSportData(sports: [Sport]) {
        mySports = sports
        collectionView.reloadData()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        mainPressenter = MainPresenter(mainView: self)
        mainPressenter?.loadSports()
        
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
           // Get the new view controller using segue.destination.
           // Pass the selected object to the new view controller.
        if (segue.identifier == "leagues_ViewCotroller"){
            let destination = segue.destination as! ViewControllerLeagues
            destination.leagueName = mySports?[collectionView.indexPathsForSelectedItems?.first?.row ?? 0].strSport
        }
           
       }
    
}

extension ViewController : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout  {
    
    
   func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
           return  mySports?.count ?? 0
      }
      func numberOfSections(in collectionView: UICollectionView) -> Int {
          return 1
      }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
         let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CustomCollectionViewCell
        if let mySports = mySports {
            cell.customImage.kf.setImage(with: URL(string: mySports[indexPath.row].strSportThumb))
            cell.customLabel.text = mySports[indexPath.row].strSport
            
            
            
            
        }
        
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.zero
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

//     func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath){
//        //let leaguesController: ViewControllerLeagues = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "leagues_ViewCotroller") as! ViewControllerLeagues
//       // leaguesController.leagueName = mySports?[indexPath.row].strSport
//        //self.present(leaguesController, animated: true, completion: nil)
//           print("selected item at row \(indexPath.row) and section \(indexPath.section)")
//           print("selected item \(indexPath.item)")
//       }
//    

    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellWidth = UIScreen.main.bounds.width / 2.0
        let cellHight = UIScreen.main.bounds.height / 5.0
           return CGSize(width: cellWidth, height: cellHight)
       }
    
}

