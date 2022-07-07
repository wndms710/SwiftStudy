//
//  LocationViewController.swift
//  MangoClone
//
//  Created by 조주은 on 2022/07/07.
//

import UIKit

class LocationViewController: UIViewController {

    @IBOutlet weak var agreeView: UIView! {
        didSet {
            let height = agreeView.frame.height
            agreeView.clipsToBounds = true
            agreeView.layer.cornerRadius = height / 2
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }


}
