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
    
}

extension ViewController : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout  {
    
    
   func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            mySports?.count ?? 0
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

//
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.zero
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

     func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath){
           print("selected item at row \(indexPath.row) and section \(indexPath.section)")
           print("selected item \(indexPath.item)")
       }
    
//     func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        let cellWidth = UIScreen.main.bounds.width / 3.0
//        let cellHight = UIScreen.main.bounds.height / 3.0
//         return CGSize(width: cellWidth, height: cellHight)
//    }
//
    
//    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
//        sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
//
//
//
//       let cellWidth = UIScreen.main.bounds.width / 3.0
//       let cellHight = UIScreen.main.bounds.height / 3.0
//
//        return CGSize(width: width, height: height);
//    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellWidth = UIScreen.main.bounds.width / 2.0
        let cellHight = UIScreen.main.bounds.height / 5.0
           return CGSize(width: cellWidth, height: cellHight)
       }
    
//    func setupCollectionViewItemSize(){
//        if collectionViewFlowLayout == nil{
//            let itemsPerRow:CGFloat = 2
//            let lineSpacing:CGFloat = 5
//            let interItemSpacing:CGFloat = 5
//            
//            let width = (collectionView.frame.width - (itemsPerRow - 1) * interItemSpacing) / itemsPerRow
//            let height = width
//            collectionViewFlowLayout = UICollectionViewFlowLayout()
//            collectionViewFlowLayout?.itemSize = CGSize(width: width, height: height)
//            collectionViewFlowLayout?.sectionInset = UIEdgeInsets(top: lineSpacing, left: lineSpacing, bottom: 0, right: lineSpacing)
//         
//            collectionView.setCollectionViewLayout(collectionViewFlowLayout!, animated: true)
//        }
//    }

    
}

