//
//  HowViewController.swift
//  MultiThreadGame
//
//  Created by 조주은 on 2022/07/05.
//

import UIKit

class HowViewController: UIViewController {

    @IBOutlet weak var howView: UIView!
    @IBOutlet weak var backVIew: UIView!
    @IBOutlet weak var middleView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.howView.clipsToBounds = true
        self.howView.layer.cornerRadius = 30
        
        self.middleView.clipsToBounds = true
        self.middleView.layer.cornerRadius = 20
        
        self.backVIew.clipsToBounds = true
        self.backVIew.layer.cornerRadius = 20
    }
    
    @IBAction func tapDismiss(_ sender: Any) {
        self.dismiss(animated: false)
    }
    
}
