//
//  ViewController.swift
//  BaeminClone2
//
//  Created by 조주은 on 2022/06/24.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var searchBackView: UIView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "우리집"
        
        searchBackView.clipsToBounds = true
        searchBackView.layer.cornerRadius = 20
        searchBackView.layer.maskedCorners = CACornerMask(arrayLiteral: .layerMaxXMaxYCorner, .layerMinXMaxYCorner)
        
        searchBar.searchTextField.backgroundColor = UIColor.clear
        
        
    }
}


