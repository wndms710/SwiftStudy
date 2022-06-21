//
//  SecondViewController.swift
//  LifeCycle
//
//  Created by 조주은 on 2022/06/20.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var data: UILabel!
    var text: String = "default"
    
    @IBAction func backView(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.data.text = text
    }
    

}
