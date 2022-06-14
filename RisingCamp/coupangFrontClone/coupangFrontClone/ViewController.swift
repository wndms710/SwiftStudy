//
//  ViewController.swift
//  coupangFrontClone
//
//  Created by 조주은 on 2022/06/09.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let logoImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 300, height: 100))
        logoImageView.contentMode = .scaleAspectFit
        let logoImage = UIImage(named: "coupangLogo")
        logoImageView.image = logoImage
        
        navigationItem.titleView = logoImageView
        
        let upSearchController = UISearchController(searchResultsController: nil)
        upSearchController.searchBar.placeholder = "쿠팡에서 검색하세요!"
        
        navigationItem.searchController = upSearchController
        
    }


}

