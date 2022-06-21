//
//  AmericanoViewController.swift
//  starbucksAppClone
//
//  Created by 조주은 on 2022/06/21.
//

import UIKit

class AmericanoViewController: UIViewController {
    @IBOutlet weak var iceView: UIView!
    @IBOutlet weak var hotView: UIView!
    @IBOutlet weak var scGroup: UISegmentedControl!
     
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        iceView.alpha = 1
        hotView.alpha = 0
    }
    
    @IBAction func switchViews(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            iceView.alpha = 0
            hotView.alpha = 1
        } else {
            iceView.alpha = 1
            hotView.alpha = 0
        }
    }
    
}
