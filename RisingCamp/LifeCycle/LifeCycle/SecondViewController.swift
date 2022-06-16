//
//  SecondViewController.swift
//  LifeCycle
//
//  Created by 조주은 on 2022/06/15.
//

import Foundation
import UIKit

class SecondViewController: UIViewController {
    @IBOutlet weak var uiResult: UILabel!
    
    @IBAction func didTapAction(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    var result : String? = "DEFAULT"
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        uiResult.text = result
        
        print("Second : viewDidLoad")

    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("Second : viewWillAppear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("Second : viewDidAppear")

    }
    
    override func viewWillDisappear(_ animated: Bool) {
        print("Second : viewWillDisappear")

    }
    
    override func viewDidDisappear(_ animated: Bool) {
        print("Second : viewDidDisappear")

    }


}

