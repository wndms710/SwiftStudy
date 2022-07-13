//
//  MapViewController.swift
//  MangoClone
//
//  Created by 조주은 on 2022/07/13.
//

import UIKit


class MapViewController: UIViewController {
    
    //MARK: - properties
    @IBOutlet weak var distanceView: UIView! {
        didSet {
            let height = distanceView.frame.size.height
            distanceView.clipsToBounds = true
            distanceView.layer.cornerRadius = height / 2
        }
    }
    
    @IBOutlet weak var filterVIew: UIView! {
        didSet {
            let height = filterVIew.frame.size.height
            filterVIew.clipsToBounds = true
            filterVIew.layer.cornerRadius = height / 2
//
            filterVIew.layer.borderWidth = 1
            filterVIew.layer.borderColor = UIColor(red: 107/255, green: 107/255, blue: 107/255, alpha: 1).cgColor
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
   

}

