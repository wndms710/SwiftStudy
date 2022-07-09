//
//  MainViewController.swift
//  MangoClone
//
//  Created by 조주은 on 2022/07/07.
//

import UIKit
import CoreLocation
import Alamofire

class MainViewController: UIViewController {
    //MARK: - properties
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet var mainView: UIView!
//    var locationManager: CLLocationManager?
    var currentLocation: CLLocationCoordinate2D!
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        if locationManager == nil {
//            let locationVC = self.storyboard?.instantiateViewController(withIdentifier: "LocationViewController") as! LocationViewController
//            locationVC.modalPresentationStyle = .overCurrentContext
//            self.present(locationVC, animated: true)
//        }
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        let topBannerCell = UINib(nibName: "MainTopCollectionViewCell", bundle: nil)
        collectionView.register(topBannerCell, forCellWithReuseIdentifier: "MainTopCollectionViewCell")
        
        let middleCell = UINib(nibName: "MiddleCollectionViewCell", bundle: nil)
        collectionView.register(middleCell, forCellWithReuseIdentifier: "MiddleCollectionViewCell")
        
        let listCell = UINib(nibName: "ListCollectionViewCell", bundle: nil)
        collectionView.register(listCell, forCellWithReuseIdentifier: "ListCollectionViewCell")
        
//        requestAuthorization()

    }
    
    override func viewDidAppear(_ animated: Bool) {
//        if locationManager == nil {
            let locationVC = self.storyboard?.instantiateViewController(withIdentifier: "LocationViewController") as! LocationViewController
            locationVC.modalPresentationStyle = .overCurrentContext
            self.present(locationVC, animated: true)
//        }
    }

    
//    private func requestAuthorization() {
//        if locationManager == nil {
//            locationManager = CLLocationManager()
//            // 정확도 검사
//            locationManager!.desiredAccuracy = kCLLocationAccuracyBest
//            // 앱을 사용할 때 권한 요청
//            locationManager!.requestWhenInUseAuthorization()
//            locationManager!.delegate = self
//            locationManagerDidChangeAuthorization(locationManager!)
//        }
//        else {
//            // 사용자의 위치가 바뀌고 있는지 확인하는 메소드
//            locationManager!.startMonitoringSignificantLocationChanges()
//        }
//    }


}

//extension MainViewController: CLLocationManagerDelegate {
//    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
//        if manager.authorizationStatus == .authorizedWhenInUse {
//            currentLocation = locationManager!.location?.coordinate
//            LocationService.shared.longitude = currentLocation.longitude
//            LocationService.shared.latitude = currentLocation.latitude
//        }
//    }
//}

//MARK: - collectionView extension
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
