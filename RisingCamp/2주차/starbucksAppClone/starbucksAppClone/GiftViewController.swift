//
//  GiftViewController.swift
//  starbucksAppClone
//
//  Created by 조주은 on 2022/06/16.
//

import UIKit

class GiftViewController: UIViewController {
    @IBOutlet weak var stackView: UIStackView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Gift"
        
        self.stackView.layer.shadowColor = UIColor.black.cgColor
        self.stackView.layer.masksToBounds = false
        self.stackView.layer.shadowOffset = CGSize(width: 0, height: 3)
        self.stackView.layer.shadowRadius = 5
        self.stackView.layer.shadowOpacity = 0.1

    }

}
