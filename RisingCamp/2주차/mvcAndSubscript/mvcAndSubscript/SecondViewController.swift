//
//  SecondViewController.swift
//  mvcAndSubscript
//
//  Created by 조주은 on 2022/06/16.
//

import Foundation
import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var tvData: UILabel!
    var text: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tvData.text = text
    }
    
}
