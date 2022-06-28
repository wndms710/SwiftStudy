//
//  ViewController.swift
//  Thread_Example_Project
//
//  Created by 조주은 on 2022/06/28.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    private func ascendingNumber() {
        for i in 0...100 {
            print(i)
            usleep(10000) // 밀리세컨드 단위
        }
    }
    
    

}

