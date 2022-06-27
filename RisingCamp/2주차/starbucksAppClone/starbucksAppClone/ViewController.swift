//
//  ViewController.swift
//  starbucksAppClone
//
//  Created by 조주은 on 2022/06/16.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    
    var isDeleted: Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "What's New"
        

    }
    
    override func viewDidAppear(_ animated: Bool) {
        let startVC = self.storyboard?.instantiateViewController(withIdentifier: "StartViewController") as! StartViewController
        
        startVC.homeVC = self
        
        if isDeleted == false {
            self.present(startVC, animated: true)
        }
    }

}


