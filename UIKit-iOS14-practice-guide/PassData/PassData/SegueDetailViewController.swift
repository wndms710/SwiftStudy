//
//  SegueDetailViewController.swift
//  PassData
//
//  Created by 조주은 on 2022/05/22.
//

import UIKit

class SegueDetailViewController: UIViewController {

    @IBOutlet weak var dataLabel: UILabel!
    
    var dataString = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        dataLabel.text = dataString
    }
    

}
