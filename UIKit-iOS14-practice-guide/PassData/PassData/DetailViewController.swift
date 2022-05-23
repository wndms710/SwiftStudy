//
//  DetailViewController.swift
//  PassData
//
//  Created by 조주은 on 2022/05/10.
//

import UIKit

class DetailViewController: UIViewController {
    
    var someString = ""

    @IBOutlet weak var someLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        someLabel.text = someString
    }

}
