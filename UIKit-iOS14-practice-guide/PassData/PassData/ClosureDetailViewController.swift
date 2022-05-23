//
//  ClosureDetailViewController.swift
//  PassData
//
//  Created by 조주은 on 2022/05/23.
//

import UIKit

class ClosureDetailViewController: UIViewController {

    var myClosure: ((String) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    @IBAction func closurePassData(_ sender: Any) {
        myClosure?("closure string")
        self.dismiss(animated: true, completion: nil)
    }
    

}
