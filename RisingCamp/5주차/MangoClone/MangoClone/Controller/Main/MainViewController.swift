//
//  MainViewController.swift
//  MangoClone
//
//  Created by 조주은 on 2022/07/07.
//

import UIKit
import SnapKit

class MainViewController: UIViewController {
    //MARK: - properties
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet var mainView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        let topBannerCell = UINib(nibName: "MainTopCollectionViewCell", bundle: nil)
        collectionView.register(topBannerCell, forCellWithReuseIdentifier: "MainTopCollectionViewCell")
        
        let middleCell = UINib(nibName: "MiddleCollectionViewCell", bundle: nil)
        collectionView.register(middleCell, forCellWithReuseIdentifier: "MiddleCollectionViewCell")
        
        let listCell = UINib(nibName: "ListCollectionViewCell", bundle: nil)
        collectionView.register(listCell, forCellWithReuseIdentifier: "ListCollectionViewCell")

    }


}

extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.row == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MainTopCollectionViewCell", for: indexPath) as! MainTopCollectionViewCell
            return cell
        }
        else if indexPath.row == 1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MiddleCollectionViewCell", for: indexPath) as! MiddleCollectionViewCell
            return cell
        }
        else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ListCollectionViewCell", for: indexPath) as! ListCollectionViewCell
            return cell
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.size.width
        let height = collectionView.frame.size.height
        if indexPath.row == 0 {
            return CGSize(width: width, height: (height * 0.19))
        }
        else if indexPath.row == 1 {
            return CGSize(width: width, height: (height * 0.16))
        }
        else {
            return CGSize(width: width / 2, height: height * 0.34)
        }
    }
    
        
}
