//
//  LocationViewController.swift
//  MangoClone
//
//  Created by 조주은 on 2022/07/07.
//

import UIKit
import CoreLocation

class LocationViewController: UIViewController {
    
    var locationManager: CLLocationManager?
    var currentLocation: CLLocationCoordinate2D!
    

    @IBOutlet weak var agreeView: UIView! {
        didSet {
            let height = agreeView.frame.height
            agreeView.clipsToBounds = true
            agreeView.layer.cornerRadius = height / 2
        }
    }
    
    @IBAction func tapAgreeBut(_ sender: Any) {
        let mainVC = self.storyboard?.instantiateViewController(withIdentifier: "CustomTabBarViewController") as! CustomTabBarViewController
        mainVC.modalPresentationStyle = .overCurrentContext
        mainVC.modalTransitionStyle = .crossDissolve
        self.present(mainVC, animated: true)
        requestAuthorization()
//        mainVC.currentLocation = self.currentLocation
//        print(mainVC.currentLocation)
    }
    
    private func requestAuthorization() {
        if locationManager == nil {
            locationManager = CLLocationManager()
            // 정확도 검사
            locationManager!.desiredAccuracy = kCLLocationAccuracyBest
            // 앱을 사용할 때 권한 요청
            locationManager!.requestWhenInUseAuthorization()
            locationManager!.delegate = self
            locationManagerDidChangeAuthorization(locationManager!)
        }
        else {
            // 사용자의 위치가 바뀌고 있는지 확인하는 메소드
            locationManager!.startMonitoringSignificantLocationChanges()
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension LocationViewController: CLLocationManagerDelegate {
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        if manager.authorizationStatus == .authorizedWhenInUse {
            currentLocation = locationManager!.location?.coordinate
            LocationService.shared.longitude = currentLocation.longitude
            LocationService.shared.latitude = currentLocation.latitude
        }
    }
}
