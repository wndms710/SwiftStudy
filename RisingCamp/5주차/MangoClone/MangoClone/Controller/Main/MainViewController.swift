//
//  MainViewController.swift
//  MangoClone
//
//  Created by 조주은 on 2022/07/07.
//

import UIKit
import CoreLocation
import Alamofire
import CoreAudio

class MainViewController: UIViewController {
    //MARK: - properties
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet var mainView: UIView!
//    var locationManager: CLLocationManager?
    var currentLocation: CLLocationCoordinate2D!
    @IBOutlet weak var seeLocation: UILabel!
    var restRequest = RestRequest()
    
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
        
        RestRequest().getRestData(self)
    }
    
    override func viewDidAppear(_ animated: Bool) {
//        if locationManager == nil {
//            let locationVC = self.storyboard?.instantiateViewController(withIdentifier: "LocationViewController") as! LocationViewController
//            locationVC.modalPresentationStyle = .overCurrentContext
//            self.present(locationVC, animated: true)
//        }
    }
    
    //MARK: - API data 호출
//    struct Stack<Element> {
//        var items = [Element]()
//        mutating func push(_ item: Element) {
//            items.append(item)
//        }
//        mutating func pop() -> Element {
//            return items.removeLast()
//    }
    
    var restData: [Item] = []
        
    func didSuccess(_ response: RestResponse){
        let restItem = response.response.body.items.item
        self.restData = restItem
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
    
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
        return restData.count + 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        if indexPath.section == 0 {
        if indexPath.row == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MainTopCollectionViewCell", for: indexPath) as! MainTopCollectionViewCell

            return cell
        }
//        else if indexPath.section == 1 {
        else if indexPath.row == 1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MiddleCollectionViewCell", for: indexPath) as! MiddleCollectionViewCell
            return cell
        }
        else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ListCollectionViewCell", for: indexPath) as! ListCollectionViewCell
            
            cell.name.text = "\(indexPath.item - 1). \(self.restData[indexPath.item - 2].title)"
    //            do {
    //                let data = try Data(contentsOf: URL(string: self.restData[indexPath.item].firstimage)!)
    //                cell.imgView.image = UIImage(data: data)
    //            }
    //            catch {
    //                print(error)
    //            }
           // Data는 background
            if let data = try? Data(contentsOf: URL(string: self.restData[indexPath.item - 2].firstimage)!) {
               //Main Thread
               DispatchQueue.main.async {
                   cell.imgView.image = UIImage(data: data)
               }
           }
           cell.readCount.text = "\(self.restData[indexPath.item - 2].readcount)"
            cell.place.text = self.restData[indexPath.item - 2].addr1
//           print(indexPath.item)
            cell.grade.text = "\(round(Double.random(in: 3.2...4.3)*10)/10)"
            cell.blog.text = "\(Int.random(in: 5...50))"
            
//            cell.layoutMargins = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
//            let layout = UICollectionViewFlowLayout()
//            layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
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
            return CGSize(width: width, height: (height * 0.15))
        }
        else {
//            return CGSize(width: (width-30) / 2 , height: height * 0.34)
            return CGSize(width: width / 2 , height: height * 0.34)
        }
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//        if indexPath.row >= 2 {
//            return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
//        }
//        else {
//            return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
//        }
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//        if let indexPath = collectionView.indexPath(for: ) {
//            if indexPath.item >= 2 {
//                return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
//            }
//        }
//    }
        
}
