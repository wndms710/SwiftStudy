//
//  ViewController.swift
//  CalculatorByJueun
//
//  Created by 조주은 on 2022/05/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    var totalValue : Float! = 0
    @IBOutlet var tempValue : UILabel!
    
    @IBAction func clickzero(_ sender: UIButton) {
        tempValue.text! += "0"
        print(0)
    }
    @IBAction func clickone(_ sender: UIButton) {
        tempValue.text! += "1"
        print(1)
    }
    @IBAction func clicktwo(_ sender: UIButton) {
        tempValue.text! += "2"
        print(2)
    }
    @IBAction func clickthree(_ sender: UIButton) {
        tempValue.text! += "3"
        print(3)
    }
    @IBAction func clickfour(_ sender: UIButton) {
        tempValue.text! += "4"
        print(4)
    }
    @IBAction func clickfive(_ sender: UIButton) {
        tempValue.text! += "5"
        print(5)
    }
    @IBAction func clicksix(_ sender: UIButton) {
        tempValue.text! += "6"
        print(6)
    }
    @IBAction func clickseven(_ sender: UIButton) {
        tempValue.text! += "7"
        print(7)
    }
    @IBAction func clickeight(_ sender: UIButton) {
        tempValue.text! += "8"
        print(8)
    }
    @IBAction func clicknine(_ sender: UIButton) {
        tempValue.text! += "9"
        print(9)
    }
    
    
}

