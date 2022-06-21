//
//  StartViewController.swift
//  starbucksAppClone
//
//  Created by 조주은 on 2022/06/21.
//

import UIKit

class StartViewController: UIViewController {
    
    var homeVC: ViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
   
    }
    
    @IBAction func tap1(_ sender: Any) {
        homeVC?.isDeleted = false
        self.dismiss(animated: true)
    }
    @IBAction func tap2(_ sender: Any)  {
        homeVC?.isDeleted =  true
        self.dismiss(animated: true)
    }
    
}
